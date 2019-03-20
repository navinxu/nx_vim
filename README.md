# Navin 的 VIM 配置
My Vim Configuration.

## 经过配置的编辑器支持的编程语言
1. php
2. c/c++
3. html、css和js(/nodejs)
4. python3
5. java

## 插件的安装
1. 安装 Git
2. 进入当前用户家目录,并克隆主分支到本地的 .vim 目录上
```sh
git clone https://github.com/navinxu/nx_vim.git .vim
```
3. 进入 .vim 目录，并新建一个空目录，名为“bundles”
4. 在当前用户家目录下创建一个指向本目录下 vimrc　文件的软链接 .vimrc。
5. 运行 Vim。
6. 普通模式下输入 :PlugInstall　，按下回车键，稍等。）

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

注意：
* 插件 YouCompleteMe 需要单独安装，需要 Python3、java、npm 和 Clang 的支持。
安装过程请移步：[YCM的Github仓库](https://github.com/Valloric/YouCompleteMe)
* 本配置仅支持 Linux 系列发行版（目前仅在 Ubuntu 部署），Windows 党请绕步！


