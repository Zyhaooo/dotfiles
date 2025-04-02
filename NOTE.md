# emacs

- 快速选择当前区域的内容 : `C-M-Space`
- 快速跳转到匹配的括号处(必须光标要在括号处,否则就是移动到上一个单词或下一个单词): `C-M-f \ C-M-b`
- 快速为选区两边添加括号(仅仅只是括号,别的不行): `M-(`
- 简单的替换: `M-%`

# golang

- 更新下载的二进制包,可以直接下载最新的包: `go install golang.org/x/tools/gopls@latest`
- go mod 中 `indirect` 代表的是间接引用

# Linux

- 文件描述符(file descriptor): 通常是一个小的非负整数
- `rpm -qa | grep kernel`: 查看内核
- `rpm -e <packages>`: 删除rpm包
- dd查看进度: sudo dd of=/dev/sda if=/dev/zero status=progress
- linux下如果需要提权的话,一般需要polkit这个工具

# hyprland

- 可以禁用xwayland的缩放然后修改DPI来避免分数缩放导致的软件模糊
  - `xwayland { force_zero_scaling = true }`
  - Xft.dpi: 192 >> .Xresources
  - xrdb -merge .Xresources

# git

- 

# rust

- rust圣经: [rust圣经](https://course.rs/about-book.html)
- tokio: [tokio中文文档](https://tokio-zh.github.io/document)
