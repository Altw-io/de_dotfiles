# Fedora 43: DE 配置展示

<video src="https://github.com/user-attachments/assets/a7a4d6f9-1075-4858-9722-df522a05bc73" controls width="100%"></video>

窗口拖拽和最小化时有果冻特效的扩展因为与录屏软件冲突，所以没有在这里展示，且由于录制有点麻烦，此处仅展示了第一版的内容。

# Fedora 43: DE 配置安装

本仓库包含我在 Fedora 43 上的部分桌面环境配置，以便后续迁移系统时可以一键恢复。

| 项目 | 说明 |
| :--- | :--- |
| **常用工具** | kitty、yazi、fastfetch、wofi、Neovim、fzf、qqMusicBox、Snipaste等 |
| **配置文件** | 包含了对 kitty、yazi、fastfetch、wofi、Neovim（LazyVim）的配置 |
| **GNOME 扩展** | 所有扩展本体 + 设置 |
| **主题** | Nordic-Polar |
| **字体** | FiraCode（包含图标）、wqy-microhei、wqy-zenhei（中文） |
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

3. 脚本执行完毕后，下载安装 `Extension Manager`，选择下列扩展安装：

| 扩展                                         | 功能                   |
| :------------------------------------------- | :--------------------- |
| AppIndicator and KStatusNotifierItem Support | 系统托盘图标支持       |
| Bluetooth Battery Meter                      | 蓝牙设备电量显示       |
| Burn My Windows                              | 窗口动画特效          |
| Compiz alike magic lamp effect               | 魔法灯缩放动画         |
| Compiz windows effect                        | Compiz风格窗口特效     |
| Desktop Cube                                 | 3D桌面立方体           |
| Emoji Copy                                   | Emoji复制工具          |
| Quick Close in Overview                      | 概览中中键关闭窗口     |
| Tiling Assistant                             | 窗口平铺辅助           |
| TopHat                                       | 系统资源监控，顶栏显示 |
| User Themes                                  | 自定义主题支持         |

在 Burn My Windows 扩展中仅选择 Energize B 样式，并调整持续时间为 600 ms。

4. 下载安装 `优化` 工具，即 `Tweaks` ，在`外观-shell`里选择 Nordic-Polar 主题进行应用。
5. 根据 [qqMusicBox](https://gitee.com/ysdlm/qqmusicbox)，先创建 conda 环境，然后编译出命令行 qq音乐工具。平时可以搭配 cava 音乐律动条使用。具体效果如下所示：

<img width="3840" height="2400" alt="qqmusicbox示例" src="https://github.com/user-attachments/assets/100b0718-8434-4d6e-bbb2-607bfb8b0d1a" />


6. 从 [Snipaste](https://github.com/Snipaste/feedback) 下载 Snipaste，并把`具体安装目录/Snipaste-2.11.3-x86_64.AppImage snip` 绑定到 F1 快捷键，其中 AppImage 的版本号由具体下载版本决定。然后设置开机自启，即可使用 F1 全局快捷键进行截屏。
