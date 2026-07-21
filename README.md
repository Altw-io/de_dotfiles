# Fedora 43: DE 配置展示

<video src="https://github.com/user-attachments/assets/a7a4d6f9-1075-4858-9722-df522a05bc73" controls width="100%"></video>

窗口拖拽和最小化时有果冻特效的扩展因为与录屏软件冲突，所以没有在这里展示。

# Fedora 43: DE 配置安装

本仓库包含我在 Fedora 43 上的部分桌面环境配置，以便后续迁移系统时可以一键恢复。

| 项目 | 说明 |
| :--- | :--- |
| **配置文件** | 包含了对 kitty、yazi、fastfetch、wofi、Neovim（LazyVim）的配置 |
| **GNOME 扩展** | 所有扩展本体 + 设置 |
| **字体** | FiraCode Nerd Font |
| **自定义 Bash 函数** | `yy`、`fo`、`ff` |

## 安装流程

1. 克隆仓库：

   ```bash
   git clone https://github.com/Altw-io/de_dotfiles.git ~/de_dotfiles
   cd ~/de_dotfiles
   ```

2. 执行安装脚本：

   ``` bash
   chmod +x install.sh
   ./install.sh
   ```

3. 脚本执行完毕后，重启 GNOME Shell 以生效扩展，可安全删除本仓库目录。
