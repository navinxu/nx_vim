# Navin 的 Vim 配置
My Vim Configuration.


具体的配置过程(包括 YouCompleteMe 的配置详细说明)，请访问：https://github.com/navinxu/nx_vim/blob/master/INSTALL.md

## 适合的 Vim 版本
vim-gtk3 => 要求 >=8.0 且支持 Python3
```bash
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

    ```bash
    git clone https://github.com/navinxu/nx_vim.git .vim
    ```
3. 进入 .vim 目录，并新建一个空目录，名为“bundles”。
4. 在当前用户家目录下创建一个指向本目录下 vimrc　文件的软链接 .vimrc。
5. 做好准备工作。
6. 运行 Vim。
7. 普通模式下输入 :PlugInstall　，按下回车键，稍等。）

## 准备
### 依赖的安装
```cpp

```
需要的依赖：
1. clang => 版本>=10.0，这要查看YCM的README文件。（也可以用 clangd 代替，这一点在后面有说明）

    参考： [C-family-Semantic-Completion-through-libclang](https://github.com/ycm-core/YouCompleteMe/wiki/C-family-Semantic-Completion-through-libclang)

    ```bash
    # 如果发行版的软件仓库中没有相应的 clang 版本，那么就到 http://releases.llvm.org/download.html#10.0.0 这里下载与操作系统对应的  llvm 预编译版本
    # 下载到 ~/Downloads，并解压
    # 编辑 .bashrc 文件，将 llvm 的 bin 目录添加到系统环境变量中
    vim ~/.bashrc
    # 添加 
    export PATH="/home/navinxu/Downloads/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin:${PATH}"
    # 使 .bashrc 的更新生效
    source ~/.bashrc
    
    sudo ln -sf ~/Downloads/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/lib/libclang.so.10 /usr/lib/x86_64-linux-gnu/
    #sudo ln -sf /usr/lib/x86_64-linux-gnu/libclang-7.so.1 /usr/lib/x86_64-linux-gnu/libclang.so.7
    ```
2. cscope
3. ctags
4. python3
5. gcc => >= 8.0
6. php
7. flake8 => 支持 Python 的语法检查
8. npm nodejs
9. eslint => 支持 js 的语法检查，通过 npm 来安装

    ```bash
    sudo npm i -g eslint
    ```
    应用 eslint 之前还要在项目的根目录生成js配置文件：
    ```bash
    eslint --init
    ```
10. Ag => 查找文本利器，对应 rking/ag.vim 插件

    ```bash
    sudo apt-get install silversearcher-ag
    ```
11. Ack => 对应 dyng/ctrlsf.vim 插件，全局搜索

    ```bash
    sudo apt-get install -y ack
    ```
12. jdk-8.0 => 以支持 java 语言

    ```bash
    sudo apt update
    sudo apt install openjdk-8-jdk
    ```
13. jsonlint => 支持 json 的语法检查

    ```bash
    sudo npm install -g jsonlint
    ```
14. tidy => 支持 HTML 的语法检查

    ```bash
    sudo apt-get install -y tidy
    ```
15. stylelint => 支持 CSS 的语法检查

    ```bash
    sudo npm i -g stylelint
    ```
16. cmake => 编译YCM时有用

    ```bash
    sudo apt install build-essential cmake python3-dev
    ```
17. pip3 和 powerline => 用于支持 powerline 插件

    ```bash
    sudo apt-get install -y python3-pip
    python3 -m pip install --user powerline-status
    ```
18. powerline fonts

    ```bash
    sudo apt-get install -y fonts-powerline
    # 重启机器
    ```
19. vint => 以支持 vim 脚本的检查

    ```bash
    sudo python3 -m pip install vint
    ```
20. shellcheck => 以支持 shell 脚本的检查

    ```bash
    sudo apt-get install -y shellcheck
    ```
21. textlint => 以支持 Markdown 的语法检查

    ```bash
    sudo npm i -g textlint
    ```
22. composer => 用于安装 PHP 类库
    安装方法参见：[GetComposer](https://getcomposer.org/)
23. (已废弃)pynvim => deoplete 必须
    
    ```bash
    # 如果未安装
    pip3 install --user pynvim
    # 如果已安装
    pip3 install --user --upgrade pynvim
    ```
24. flowbin => 支持 JS 插件 autocomplete-flow 需要
    
    ```bash
    npm install --global flow-bin
    ```
25. ispell => 插件 vimspell 需要

    ```bash
    sudo apt-get install -y ispell
    ```
26. 编译安装 gtags 和　gtags-cscope　以支持　gutentags_plus

详见本人博客： [Ubuntu 18.04 安装 gtags 和 gtags-cscope 以支持 Vim 插件 gutentags_plus](https://chengxuzhilu.com/2027.html)

### 完成安装 phpactor 插件的最后一步
把 `~/.vim/bundles/phpactor/bin` 路径追加进 PATH 系统环境变量中，以及把它写进 `~/.bashrc` 文件。最后一步是执行 `source ~/.bashrc`。


### 让 Vim 支持 Laravel （若 phpcd.vim 插件在启用状态）
先进入 Laravel 项目根目录执行：
```bash
composer require --dev barryvdh/laravel-ide-helper
php artisan ide-helper:generate
```
在项目根目录新建文件 .phpcd.vim，并且输入以下内容：
```vim
let g:phpcd_autoload_path = '.autoload.php'
```
最后在根目录创建 .autoload.php 文件，并输入：
```php
<?php
require './vendor/autoload.php';
require './_ide_helper.php';
```
在其他非 composer 项目可以这样：
```php
<?php
require 'Class1.php';
require 'Class2.php';
require 'Class3.php';
```


### Vim 通过 phpactor 插件支持 Laravel (好像无效，会使补全失效)
在项目根目录新建 `.phpactor.json` 文件，并将 `phpactor config:dump` 命令的输出结果中虚线以下的内容装进 `.phpactor.json` 文件中。
然后:
```bash
composer require jetbrains/phpstorm-stubs
```
完成。


以上的一些通过 apt-get 安装的软件可以一次性安装：
```bash
sudo apt-get install -y build-essential cmake python3-dev gcc-8 g++-8 cscope ctags npm nodejs python3 silversearcher-ag ack openjdk-8-jdk tidy python3-pip fonts-powerline shellcheck ispell flake8 --fix-missing
```


注意：
* ycm_extra_conf.py 文件需要gcc以及g++的版本 >=8.0 的支持。 
* 插件 YouCompleteMe 需要单独安装，需要 Python3、java、npm 和 Clangd (>= 10.0，可到 http://releases.llvm.org/download.html 下载该版本与操作系统相对应的二进制包，然后将 clangd 10.0+ 二进制文件目录（也就是 bin 目录）添加到系统环境变量 PATH 中去)的支持，然后将 clangd 在 `/usr/bin/`目录下创建软链接：`ln -sf ~/Downloads/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin/clangd /usr/bin/`。如果编译该插件的时候用的是 Python3，那么g:ycm_server_python_interpreter 的值应指向 Python3 而不是 Python2，否则反之。

安装过程请移步：[YCM的Github仓库](https://github.com/ycm-core/YouCompleteMe)

参考： [Full Installation Guide](https://github.com/ycm-core/YouCompleteMe/wiki/Full-Installation-Guide)

* 本配置仅支持 Linux 系列发行版（目前仅在 Ubuntu 部署），Windows 党请绕步！
* 为支持 undodir，那么要在 .vim 目录下新建一个空目录————`undodir`


