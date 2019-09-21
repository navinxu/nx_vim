# Navin 的 Vim 配置
My Vim Configuration.

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
1. clang => 版本>=8.0，这要查看YCM的README文件

    ```bash
    # 到 http://releases.llvm.org/download.html#8.0.0 这里下载与操作系统对应的  llvm 预编译版本
    # 下载到 ~/Downloads，并解压
    # 编辑 .bashrc 文件，将 llvm 的 bin 目录添加到系统环境变量中
    vim ~/.bashrc
    # 添加 
    export PATH="/home/navinxu/Downloads/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04/bin:${PATH}"
    # 使用 .bashrc 的更新生效
    source ~/.bashrc
    
    sudo ln -sf ~/Downloads/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04/lib/libclang.so.8 /usr/lib/x86_64-linux-gnu/
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
23. pynvim => deoplete 必须
    
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

### 让 Vim 支持 Laravel 
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
require './file1.php';
require './file2.php';
require './file3.php';
...
```

以上的一些通过 apt-get 安装的软件可以一次性安装：
```bash
sudo apt-get install -y clang-8 clang++-8 gcc-8 g++-8 cscope ctags npm nodejs python3 silversearcher-ag ack openjdk-8-jdk tidy python3-pip fonts-powerline shellcheck --fix-missing
```


注意：
* ycm_extra_conf.py 文件需要gcc以及g++的版本 >=8.0 的支持。 
* 插件 YouCompleteMe 需要单独安装，需要 Python3、java、npm 和 Clang 的支持，如果编译该插件的时候用的是 Python3，那么g:ycm_server_python_interpreter 的值应指向 Python3 而不是 Python2，否则反之。
安装过程请移步：[YCM的Github仓库](https://github.com/Valloric/YouCompleteMe)
* 本配置仅支持 Linux 系列发行版（目前仅在 Ubuntu 部署），Windows 党请绕步！


