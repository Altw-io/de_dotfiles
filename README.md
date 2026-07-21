# Fedora 43 DE 配置展示

https://github.com/user-attachments/assets/d64de3c8-a1bf-42d3-92aa-1cf49f25321c
（窗口拖拽和最小化时的果冻特效因为与录屏软件冲突，所以没有在这里展示）

# Fedora 43：DE 配置安装

本仓库包含我在 Fedora 43 上的部分桌面环境配置，涵盖：

- **软件包列表**：`packages.txt`（通过 `dnf` 安装）
- **配置文件**：`kitty`、`yazi`、`fastfetch`、`wofi` 以及 Neovim（LazyVim） 的完整配置
- **GNOME 扩展**：所有扩展本体 + 设置（`dconf`）
- **字体**：FiraCode Nerd Font
- **自定义 Bash 函数**：`yy`（Yazi 自动切换目录）、`ff`（Fastfetch 随机 Logo）

所有配置文件均通过复制方式恢复，恢复后可安全删除本仓库目录，系统环境完全独立。

---

1. 克隆仓库：

   ```bash
   git clone https://github.com/Altw-io/de_dotfiles.git ~/de_dotfiles
   cd ~/de_dotfiles
   ```

2. 执行恢复脚本：

   ``` bash
   chmod +x install.sh
   ./install.sh
   ```

3. 脚本执行完毕后，重启 GNOME Shell 以生效扩展。
