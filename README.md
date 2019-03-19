# nx_vim
My Vim Configuration.

## Installation
1. 新建一个空目录，名为“bundles”
2. 在当前用户目录下创建一个指向本目录下 vimrc　文件的软链接 .vimrc。
3. 运行 Vim。
4. 普通模式下输入 :PlugInstall　，按下回车键，稍等。（这一步之前需要安装Git）

## 依赖的安装
需要的依赖：
1. clang >= 8.0
2. cscope
3. ctags
4. python3
5. gcc
6. php
7. pyflakes => 通过 pip3 来安装
```sh
sudo python3 -m pip install pyflakes
```
8. npm nodejs
9. eslint => 通过 npm 来安装

注意：插件 YouCompleteMe 需要单独安装，需要 Python3、npm 和 Clang 的支持。
安装过程请移步：[YCM的Github仓库](https://github.com/Valloric/YouCompleteMe)
