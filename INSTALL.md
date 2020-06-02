# 我的 Vim 配置安装完全指南
Created On: 2020-06-01

> 操作系统: Ubuntu 18.04 LTS x64 Desktop

> 本人的 Vim 配置的 Github 仓库网址是：　https://github.com/navinxu/nx_vim


## 安装 Vim

要求的 Vim 版本是 >=8.0

```bash
$ sudo apt-get install -y vim-gtk3
```


## 安装 Git
```bash
$ sudo apt-get install -y git
```


## 从 Github 下载 Vim 配置文件
```bash
$ cd ~
$ git clone https://github.com/navinxu/nx_vim.git .vim
```


## 新建插件放置目录
```bash
$ mkdir ~/.vim/bundles
```


## 创建指向 .vim/vimrc 的软链接 ~/.vimrc
```bash
$ ln -sf ~/.vim/vimrc ~/.vimrc
```


## 安装依赖(通过 apt)
```bash
# 保证 gcc >= 8.0,以及 JDK >= 8.0
$ sudo apt-get install -y build-essential cmake python3-dev gcc-8 g++-8 cscope ctags npm nodejs python3 silversearcher-ag ack openjdk-8-jdk tidy python3-pip fonts-powerline shellcheck ispell flake8 --fix-missing
```


## 更改 npm 为国内源
```bash
$ npm config set registry https://registry.npm.taobao.org
```


## 更新 npm 和 nodejs 的版本
```bash
$ sudo npm install -g -U npm
$ sudo npm install -g -U n
$ sudo n stable
$ sudo ln -sf /usr/local/bin/node /usr/bin/node
$ sudo ln -sf /usr/local/bin/node /usr/bin/nodejs
```


## 安装依赖(通过 npm 安装)
```bash
$ sudo npm i -g eslint
$ sudo npm i -g jsonlint
$ sudo npm i -g stylelint
$ sudo npm i -g textlint
$ sudo npm i -g flow-bin 
```


## 创建 python3 的软链接 python

编译和运行 YCM 必须要有
```bash
$ sudo ln -sf /usr/bin/python3 /usr/bin/python
```


## 安装依赖(通过 pip3 安装)
1. 如果没有安装 pip3,则安装:

    ```bash
    $ sudo apt-get install -y python3-pip
    ```
2. 更改 pip3 的源指向国内源

    ```bash
    $ mkdir ~/.pip
    $ touch ~/.pip/pip.conf
    $ gedit ~/.pip/pip.conf
    ```
3. 安装依赖

    ```bash
    $ sudo python3 -m pip install -U pip    
    $ python3 -m pip install --user powerline-status
    $ sudo python3 -m pip install vint
    ```


## 安装 composer (phpactor 插件需要)
1. 首先安装 PHP(保证 PHP >= 7.3):

    ```bash
    $ sudo add-apt-repository ppa:ondrej/php
    $ sudo apt-get update
    $ sudo apt-get install -y \
    php7.3            php7.3-enchant    php7.3-mbstring   php7.3-snmp \
    php7.3-bcmath     php7.3-fpm        php7.3-mysql      php7.3-soap \
    php7.3-bz2        php7.3-gd         php7.3-odbc       php7.3-sqlite3 \
    php7.3-cgi        php7.3-gmp        php7.3-opcache    php7.3-sybase \
    php7.3-cli        php7.3-imap       php7.3-pgsql      php7.3-tidy \
    php7.3-common     php7.3-interbase  php7.3-phpdbg     php7.3-xml \
    php7.3-curl       php7.3-intl       php7.3-pspell     php7.3-xmlrpc \
    php7.3-dba        php7.3-json       php7.3-readline   php7.3-xsl \
    php7.3-dev        php7.3-ldap            php7.3-zip   
    ```
    安装有些慢,如果实在太慢,可以先按 Ctrl+c 结束安装,然后再次运行,经过多次这样的操作就可以安装成功.

2. 安装 composer
参见: https://getcomposer.org/download/


依赖安装完成.


## 开始安装 Vim 插件
1. 首先进入 Vim (在插件还没有安装好之前,会有错误提示,不过以后会没有的).
2. 在命令/一般模式下输入 `:PlugInstall`.之后要耐心等待,毕竟 Github 不在国内.若是遇到下载错误,那必须尝试退出然后再次进入 Vim 执行同一命令,直到 `Finishing ... Done!`  出现.
3. 进入 ~/.vim/bundles/phpactor 再执行一下 composer 命令,直到依赖安装完成为止:

    ```bash
    $ cd ~/.vim/bundles/phpactor
    $ composer install
    $ vim ~/.bashrc
    # 追加以下内容：
    export PATH="${HOME}/.vim/bundles/phpactor/bin:${PATH}"
    # 保存退出
    # 使生效
    $ source ~/.bashrc
    ```


## 编译安装 YouCompleteMe 

### 准备

1. 由于目前 YCM 要求 clangd 的版本要大于等于 10.0,所以要在 LLVM 网站 (https://releases.llvm.org/download.html) 上下载最新的与操作系统对应的编译好的二进制打包文件(Pre-Built Binaries).这里是: Ubuntu 18.04,将其下载到 `~/Download` 目录,然后解压:

    ```bash
    # 可能下载速度很慢，如果想快些，那么请你另想办法，一定会有办法的。
    $ wget https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
    $ tar Jxvf clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
    ```
    得到 `clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04` 目录
2. 將上面解压到的 LLVM 目录下的 bin 目录加入系统环境变量中去,以使用其的 clang、clang++及 clangd 三个命令。

    ```bash
    $ vim ~/.bashrc
    # 追加以下内容：
    export PATH="${HOME}/Downloads/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin:${HOME}/.vim/bundles/phpactor/bin:${PATH}"
    # 保存退出
    # 使生效
    $ source ~/.bashrc
    $ sudo ln -sf ~/Downloads/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin/clangd /usr/bin/
    $ sudo ln -sf ~/Downloads/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin/clang /usr/bin/
    $ sudo ln -sf ~/Downloads/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin/clang++ /usr/bin/
    # 如果执行以下命令
    $ whereis clang
    ```
    得到以下的结果：
    ```ini
    clangd: /usr/bin/clangd /home/username/Downloads/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin/clangd
    ```
    那么 clangd 就部署好了。

3. 进入 ycm 的目录

    ```bash
    $ cd ~/.vim/bundles/YouCompleteMe/
    ```
4. 执行 git 初始化任务

    ```bash
    $ git submodule update --init --recursive
    ```
    如果以上命令执行时没有输出，则表示 YCM 所需的代码下载完成。

### 修改编译时必要组件的下载服务器（换成国内）

因为之前安装了 ag ，所以就用 `ag` 命令来搜索官方的域名，eclipse.org，然后将它替换为国内服务器，这样下载会快很多。
```bash 
$ ag "eclipse.org" .
```
查找结果：
```ini
...
third_party/ycmd/build.py
975:  JDTLS_SERVER_URL_FORMAT = ( 'http://download.eclipse.org/jdtls/snapshots/'
```
找的就是这个文件！然后，把 `http://download.eclipse.org/` 替换为 `http://mirrors.neusoft.edu.cn/eclipse/`。

### 开始编译 YCM
执行以下命令进行编译：
```bash
./install.py --js-completer --clangd-completer --java-completer
```
编译过程中出现一些错误而终止了编译：
```ini
npm ERR! code EACCES
npm ERR! syscall mkdir
npm ERR! path /home/username/.npm/_cacache/index-v5/a9/0f
npm ERR! errno -13
npm ERR!
npm ERR! Your cache folder contains root-owned files, due to a bug in
npm ERR! previous versions of npm which has since been addressed.
npm ERR!
npm ERR! To permanently fix this problem, please run:
npm ERR!   sudo chown -R 1000:1000 "/home/username/.npm"

npm ERR! A complete log of this run can be found in:
npm ERR!     /home/username/.npm/_logs/2020-06-01T07_27_26_302Z-debug.log
```
解决此问题的方法是执行：
```bash
sudo chown -R 1000:1000 /home/username/.npm
```
再次用同样的参数进行编译。
```bash
./install.py --js-completer --clangd-completer --java-completer
```

如果遇到：
```ini
Done installing Clangd
Clangd completer enabled. If you are using .ycm_extra_conf.py files, make sure they use Settings() instead of the old and deprecated FlagsForFile().
```
那么就表示编译成功！


## 创建 undodir 目录(用于通过插件来保存文件修改记录)
```bash
$ mkdir ~/.vim/undodir
```


## 如果只想配置 YCM
先安装以下依赖，然后就参考前面所撰写的步骤：
```bash
$ sudo apt-get install -y build-essential cmake python3-dev npm nodejs python3 python3-pip openjdk-8-jdk --fix-missing
```

如果不想要 js 和 Java，那么编译指令就要变成：
```bash
./install.py --clangd-completer
```
其他的由你灵活掌握！


然后可参考本人的 Vim 配置文件 `vimrc.plugin.conf` 的最前面部分，YCM 配置结束位置有 `END` 字样的边界。

另，如果没有仓库中那三个 `ycm_extra_conf.py` 文件，则 YCM 会变成没有用的废物。

YouCompleteMe 的官方仓库是：https://github.com/ycm-core/YouCompleteMe

YCM 的配置详细信息：　https://github.com/ycm-core/YouCompleteMe/wiki/Full-Installation-Guide


## 结语

本人的 Vim 配置就此配置完成，工作平台是 Ubuntu 18.04.4 LTS。其他操作系统上尚未尝试过，若你需要在其他操作系统上配置，那么就要参考 Github 上面以及网络上的资料进行了。
