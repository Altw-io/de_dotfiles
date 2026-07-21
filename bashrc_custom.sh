# 打开yazi，且退出 yazi 后自动切换到最后浏览的目录
yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# 在文件资源管理器打开当前目录，支持跟路径
fo() {
  if [ $# -eq 0 ]; then
    xdg-open . # 不带参数，打开当前目录
  else
    xdg-open "$1" # 带路径，打开指定目录/文件
  fi
}

ff() {
  # 配置文件和 Logo 目录路径
  local config_file="$HOME/.config/fastfetch/config.jsonc"
  local logo_dir="$HOME/.config/fastfetch/logo"

  # 获取所有以数字开头的文件（带路径）
  local files=( "$logo_dir"/[0-9]* )

  # 随机选择一个文件路径
  local selected_file="${files[$((RANDOM % ${#files[@]}))]}"
  
  # 用 sed 替换配置文件中的 source 行
  # 注意：假设原行是 "source": "...",  且双引号存在
  sed -i "s|\"source\": \".*\"|\"source\": \"$selected_file\"|" "$config_file"

  # 运行 fastfetch
  fastfetch
}
