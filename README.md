# Navin 的 VIM 配置
My Vim Configuration.

## 适合的 Vim 版本
vim-gtk3 => 要求 >=8.0 且支持 Python3
```sh
sudo apt-get install -y vim-gtk3
```

## 支持的编程语言
1. php
2. c/c++
3. html、css和js(/nodejs)
4. python3
5. java
6. json
7. vimscript
8. bash/shell
9. markdown

## 插件的安装
1. 安装 Git。
2. 进入当前用户家目录,并克隆主分支到本地的 .vim 目录上
```sh
git clone https://github.com/navinxu/nx_vim.git .vim
```
3. 进入 .vim 目录，并新建一个空目录，名为“bundles”。
4. 在当前用户家目录下创建一个指向本目录下 vimrc　文件的软链接 .vimrc。
5. 运行 Vim。
6. 普通模式下输入 :PlugInstall　，按下回车键，稍等。）

## 依赖的安装
```cpp

```
需要的依赖：
1. clang => 版本>=7.0，这要查看YCM的README文件
```sh
sudo apt-get install -y clang-7
sudo ln -sf /usr/lib/x86_64-linux-gnu/libclang-7.so.1 /usr/lib/x86_64-linux-gnu/libclang.so.7
```
2. cscope
3. ctags
4. python3、Python2
5. gcc
6. php
7. flake8 => 支持 Python 的语法检查
8. npm nodejs
9. eslint => 支持 js 的语法检查，通过 npm 来安装
应用 eslint 之前还要在项目的根目录生成js配置文件：
```sh
eslint --init
```
10. Ag => 查找文本利器，对应 rking/ag.vim 插件
```sh
sudo apt-get install silversearcher-ag
```
11. Ack => 对应 dyng/ctrlsf.vim 插件，全局搜索
```sh
sudo apt-get install -y ack
```
12. jdk-8.0 => 以支持 java 语言
```sh
sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt install oracle-java8-installer
```
13. jsonlint => 支持 json 的语法检查
14. tidy => 支持 HTML 的语法检查
15. stylelint => 支持 CSS 的语法检查
16. cmake => 编译YCM时有用
```sh
sudo apt install build-essential cmake python3-dev
```
17. pip3 和 powerline => 用于支持 powerline 插件
```sh
sudo apt-get install -y python3-pip
python3 -m pip install --user powerline-status
```
18. powerline fonts
```sh
sudo apt-get install -y fonts-powerlione
# 重启机器
```
19. vint => 以支持 vim 脚本的检查
```sh
sudo python3 -m pip install vint
```
20. shellcheck => 以支持 shell 脚本的检查
```sh
sudo apt-get install -y shellcheck
```
21. textlint => 以支持 Markdown 的语法检查
```sh
sudo npm i -g textlint
```

注意：
* 插件 YouCompleteMe 需要单独安装，需要 Python3、java、npm 和 Clang 的支持，如果编译该插件的时候用的是 Python3，那么g:ycm_server_python_interpreter 的值应指向 Python3 而不是 Python2，否则反之。
安装过程请移步：[YCM的Github仓库](https://github.com/Valloric/YouCompleteMe)
* 本配置仅支持 Linux 系列发行版（目前仅在 Ubuntu 部署），Windows 党请绕步！


