#!/bin/bash
set -e

# 颜色定义
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}>>> 开始恢复 Fedora 43 DE 环境 ...${NC}"

# 1. 更新系统
echo -e "${GREEN}>>> 更新系统包...${NC}"
sudo dnf update -y

# 2. 启用 Copr 仓库（如果有）
if [ -f "copr-repos.txt" ]; then
  echo -e "${GREEN}>>> 启用 Copr 仓库...${NC}"
  while IFS= read -r repo; do
    if [ -n "$repo" ]; then
      sudo dnf copr enable -y "$repo"
    fi
  done <copr-repos.txt
fi

# 3. 安装所有软件包（来自 packages.txt）
if [ -f "packages.txt" ]; then
  echo -e "${GREEN}>>> 安装软件包列表...${NC}"
  # 将 packages.txt 中的包名转为一行，用空格分隔
  packages=$(cat packages.txt | tr '\n' ' ')
  sudo dnf install -y $packages
else
  echo -e "${YELLOW}警告: packages.txt 不存在，跳过软件包安装。${NC}"
fi

# 4. 恢复所有配置文件（使用复制，而非软链接）
echo -e "${GREEN}>>> 恢复所有配置文件（复制模式）...${NC}"

# 定义需要恢复的配置列表
configs="yazi fastfetch kitty wofi nvim"
for config in $configs; do
  target_dir="$HOME/.config/$config"
  source_dir="$(pwd)/configs/$config"

  # 检查源目录是否存在
  if [ ! -d "$source_dir" ]; then
    echo -e "${YELLOW}警告: 源目录 $source_dir 不存在，跳过 $config${NC}"
    continue
  fi

  # 如果目标目录已存在，先备份（带时间戳）
  if [ -d "$target_dir" ]; then
    backup_dir="${target_dir}.bak.$(date +%s)"
    mv "$target_dir" "$backup_dir"
    echo -e "${YELLOW}已备份原有 $config 配置到 $backup_dir${NC}"
  fi

  # 复制配置文件
  cp -r "$source_dir" "$target_dir"
  echo -e "${GREEN}已恢复 $config 配置到 $target_dir${NC}"
done

# 5. 安装所有字体（复制 fonts 目录全部内容）
echo -e "${GREEN}>>> 安装字体...${NC}"
if [ -d "fonts" ]; then
  mkdir -p ~/.local/share/fonts
  # 复制所有内容（包括隐藏文件）到目标目录
  cp -r fonts/. ~/.local/share/fonts/
  fc-cache -fv
  echo -e "${GREEN}字体安装完成${NC}"
else
  echo -e "${YELLOW}警告: fonts 目录不存在，跳过字体安装。${NC}"
fi

# 6. 将自定义 Bash 函数直接写入 ~/.bashrc
if [ -f "bashrc_custom.sh" ]; then
  echo -e "${GREEN}>>> 将自定义函数添加到 ~/.bashrc...${NC}"
  # 创建一个标记，防止重复添加
  MARKER="# ---- de_dotfiles custom functions ----"
  if ! grep -q "$MARKER" ~/.bashrc; then
    echo "$MARKER" >>~/.bashrc
    cat bashrc_custom.sh >>~/.bashrc
    echo -e "${GREEN}自定义函数已添加到 ~/.bashrc${NC}"
  else
    echo -e "${YELLOW}自定义函数已存在，跳过添加。${NC}"
  fi
else
  echo -e "${YELLOW}警告: bashrc_custom.sh 不存在，跳过。${NC}"
fi

# 7. 复制桌面主题
echo -e "${GREEN}>>> 复制桌面主题 Nordic-Polar...${NC}"
if [ -d "Nordic-Polar" ]; then
  mkdir -p ~/.themes
  cp -r Nordic-Polar ~/.themes/
  echo -e "${GREEN}主题复制完成${NC}"
else
  echo -e "${YELLOW}警告: Nordic-Polar 目录不存在，跳过主题复制。${NC}"
fi

# 8. 提示完成
echo -e "${GREEN}>>> 脚本安装部分已完成！${NC}"
echo -e "${YELLOW}提示: 首次打开 nvim 时，Lazy.nvim 会自动下载并安装所有插件，请耐心等待。${NC}"
echo -e "${YELLOW}注意: 配置文件已复制到 ~/.config/，你可以安全删除本仓库目录。${NC}"
