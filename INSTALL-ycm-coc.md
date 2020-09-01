# 我的 Vim 配置安装完全指南

Created On: 2020-06-01

> 操作系统: Ubuntu 20.04 LTS x64 Desktop for WSL 2
>
> 本人的 Vim 配置的 Github 仓库网址是：　https://github.com/navinxu/nx_vim

## 安装 Vim

要求的 Vim 版本是 >=8.0

```bash
sudo apt-get install -y vim-gtk3
```

## 安装 Git

```bash
sudo apt-get install -y git
```

## 从 Github 下载 Vim 配置文件

```bash
cd ~
git clone https://github.com/navinxu/nx_vim.git .vim
```

## 新建插件放置目录

```bash
mkdir ~/.vim/bundles
```

## 创建指向 .vim/vimrc 的软链接 ~/.vimrc

```bash
ln -sf ~/.vim/vimrc ~/.vimrc
```

## 安装依赖(通过 apt)

```bash
# 保证 gcc >= 8.0,以及 JDK >= 8.0
sudo apt-get install -y build-essential cmake python3-dev gcc-8 g++-8 cscope ctags npm nodejs python3 silversearcher-ag ack openjdk-8-jdk tidy python3-pip fonts-powerline shellcheck ispell flake8 --fix-missing
```

## 更改 npm 为国内源

```bash
npm config set registry https://registry.npm.taobao.org
```

## 更新 npm 和 nodejs 的版本

```bash
sudo npm install -g -U npm
sudo npm install -g -U n
sudo n stable
sudo ln -sf /usr/local/bin/node /usr/bin/node
sudo ln -sf /usr/local/bin/node /usr/bin/nodejs
```

## 安装依赖(通过 npm 安装)

```bash
sudo npm i -g eslint
sudo npm i -g jsonlint
sudo npm i -g stylelint
sudo npm i -g flow-bin
```

## 安装 mdl 用于 MarkDown 语法提示

```bash
# 安装 Ruby
sudo apt-get install ruby-full -y
sudo gem install mdl
```

## 创建 python3 的软链接 python

编译和运行 YCM 必须要有

```bash
sudo ln -sf /usr/bin/python3 /usr/bin/python
```

## 安装依赖(通过 pip3 安装)

1. 更改 pip3 的源指向国内源

    ```bash
    mkdir ~/.pip
    touch ~/.pip/pip.conf
    gedit ~/.pip/pip.conf
    ```

    键入以下内容到 `pip.conf` 文件：

    ```ini
    [global]
    index-url = https://pypi.tuna.tsinghua.edu.cn/simple
    ```

1. 安装依赖

    ```bash
    $ sudo python3 -m pip install -U pip
    $ python3 -m pip install --user powerline-status
    $ sudo python3 -m pip install vint
    ```

## 安装 composer (Phpactor 插件需要)

1. 首先安装 PHP(保证 PHP >= 7.3,这里安装 7.4，Ubuntu 20.04 提供 PHP 7.4 直接安装):

    ```bash
    sudo apt-get install -y \
    php7.4            php7.4-enchant    php7.4-mbstring   php7.4-snmp \
    php7.4-bcmath     php7.4-fpm        php7.4-mysql      php7.4-soap \
    php7.4-bz2        php7.4-gd         php7.4-odbc       php7.4-sqlite3 \
    php7.4-cgi        php7.4-gmp        php7.4-opcache    php7.4-sybase \
    php7.4-cli        php7.4-imap       php7.4-pgsql      php7.4-tidy \
    php7.4-common     php7.4-interbase  php7.4-phpdbg     php7.4-xml \
    php7.4-curl       php7.4-intl       php7.4-pspell     php7.4-xmlrpc \
    php7.4-dba        php7.4-json       php7.4-readline   php7.4-xsl \
    php7.4-dev        php7.4-ldap            php7.4-zip
    ```

1. Ubuntu 18.04  安装 PHP 7.3：

    ```bash
    sudo add-apt-repository ppa:ondrej/php
    sudo apt-get update
    sudo apt-get install -y \
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

1. 安装 composer

参见: https://getcomposer.org/download/

1. 配置 Composer 国内镜像

    ```bash
    composer config -g repo.packagist composer https://packagist.phpcomposer.com
    ```

依赖安装完成.

## 开始安装 Vim 插件

1. 首先进入 Vim (在插件还没有安装好之前,会有错误提示,不过以后会没有的).
1. 在命令/一般模式下输入 `:PlugInstall`.之后要耐心等待,毕竟 Github 不在国内.若是遇到下载错误,那必须尝试退出然后再次进入 Vim 执行同一命令,直到 `Finishing ... Done!`  出现.

## 安装 Phpactor

1. 进入 ~/.vim/bundles/phpactor 再执行一下 composer 命令,直到依赖安装完成为止:

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

#### 安装 clangd 方法一（Ubuntu 18.04 也可以用）

1. 由于目前 YCM 要求 clangd 的版本要大于等于 10.0,所以要在 LLVM 网站 (https://releases.llvm.org/download.html) 上下载最新的与操作系统对应的编译好的二进制打包文件(Pre-Built Binaries).这里是: Ubuntu 18.04,将其下载到 `~/Download` 目录,然后解压:

    ```bash
    # 可能下载速度很慢，如果想快些，那么请你另想办法，一定会有办法的。
    wget https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
    tar Jxvf clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
    ```

    得到 `clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04` 目录
1. 將上面解压到的 LLVM 目录下的 bin 目录加入系统环境变量中去,以使用其的 clang、clang++及 clangd 三个命令。

    ```bash
    vim ~/.bashrc
    # 追加以下内容：
    export PATH="${HOME}/Downloads/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin:${HOME}/.vim/bundles/phpactor/bin:${PATH}"
    # 保存退出
    # 使生效
    source ~/.bashrc
    sudo ln -sf ~/Downloads/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin/clangd /usr/bin/
    sudo ln -sf ~/Downloads/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin/clang /usr/bin/
    sudo ln -sf ~/Downloads/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin/clang++ /usr/bin/
    # 如果执行以下命令
    whereis clang
    ```

    得到以下的结果：

    ```ini
    clangd: /usr/bin/clangd /home/username/Downloads/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin/clangd
    ```

    #### 安装 Clangd 10 方法 二 （只能 Ubuntu 20.04 用）

    ```bash
    sudo apt-get install -y clang-10 clangd-10
    whereis clangd-10
    ```

    执行结果：

    ```
    clangd-10: /usr/bin/clangd-10 /usr/share/man/man1/clangd-10.1.gz
    ```

    然后创建 clangd-10 和 clang-10 的软链接：

    ```bash
    sudo ln -sf /usr/bin/clang-10 /usr/bin/clang
    sudo ln -sf /usr/bin/clangd-10 /u
sr/bin/clangd
    ```

    那么 clangd 就部署好了。

### 编译 YouCompleteMe

1. 进入 ycm 的目录

    ```bash
    $ cd ~/.vim/bundles/YouCompleteMe/
    ```

1. 执行 git 初始化任务

    ```bash
    $ git submodule update --init --recursive
    ```

    如果以上命令执行时没有输出，则表示 YCM 所需的代码下载完成。

### 修改编译时必要组件的下载服务器（换成国内）

因为之前安装了 ag ，所以就用 `ag` 命令来搜索官方的域名，eclipse.org，然后将它替换为国内服务器，这样下载会快很多。

```bash
ag "eclipse.org" .
```

查找结果：

```
...
third_party/ycmd/build.py
975:  JDTLS_SERVER_URL_FORMAT = ( “http://download.eclipse.org/jdtls/snapshots/”
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

由于 Coc-nvim 插件也可以作为 C/C++ 代码提示的前端，因此以下命令也可不加上编译条件 `--clangd-completer`。

```bash
./install.py --js-completer --clangd-completer--java-completer
```

如果遇到：

```ini
Done installing Clangd
Clangd completer enabled. If you are using .ycm_extra_conf.py files, make sure they use Settings() instead of the old and deprecated FlagsForFile().
```

那么就表示编译成功！

## 安装配置 Coc-nvim

YCM 可以作为 Phpactor 的前端，同样地，Coc-nvim 也可以，貌似 Coc-nvim 更加易用一点。本人这个配置不单止 PHP 使用 coc，而且也在 C/C++ 上应用。

### 首先创建以下文件并执行一次

注释部分因为已经完成或者没有必要而不执行。

```bash
vim ~/.vim/coc-automation-script.sh
```

该文件内容在 https://github.com/neoclide/coc.nvim/wiki/install-coc.nvim 页面的底部，仅供参考。

```bash
#!/usr/bin/env bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

### # Install latest nodejs
### if [ ! -x "$(command -v node)"  ]; then
###         curl --fail -LSs https://install-node.now.sh/latest | sh
###             export PATH="/usr/local/bin/:$PATH"
###                 # Or use apt-get
###                     # sudo apt-get install nodejs
### fi
###
### # Use package feature to install coc.nvim
###
### # for vim8
### mkdir -p ~/.vim/pack/coc/start
### cd ~/.vim/pack/coc/start
### curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -
### # for neovim
### # mkdir -p ~/.local/share/nvim/site/pack/coc/start
### # cd ~/.local/share/nvim/site/pack/coc/start
### # curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -

# Install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json  ]
then
      echo '{"dependencies":{}}'> package.json
fi
# Change extension names to the extensions you need
npm install coc-snippets --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
```

保存，退出。

```bash
chmod +x ~/.vim/coc-automation-script.sh
bash ~/.vim/coc-automation-script.sh
```

### 在 Vim 内，:CocConfig 打开 Coc 的配置文件

然后在 .vim 目录下会有个 `coc-settings.json` 文件，本文后面如无特殊说明，关于 coc.nvim 插件的配置均在此文件内。

文件内容请参考：https://phpactor.readthedocs.io/en/develop/lsp/vim.html

### 在 Vim 内，安装 Coc 的插件（Coc extensions）

1. coc-clangd

    1. 此插件作为 clangd 的前端，为 C/C++/ObjectC 提供代码提示服务。

    1. 安装方法： `:CocInstall coc-clangd`

    1. 配置：

    vim .vim/coc-settings.json

    ```json
    "clangd.enabled": true,
    "clangd.path": "clangd"
    ```

	具体配置请参阅： https://github.com/clangd/coc-clangd

1. coc-css

    1. 此插件作为 css (层叠样式表) 对 Coc 前端代码提示提供服务端功能。

    1. 安装方法： `:CocInstall coc-css`

    1. 配置：

    ```json
    "css.enable": true,
    "css.trace.server": "verbose"
    ```

	具体配置请参阅： https://github.com/neoclide/coc-css

1. coc-emmet

    1. 为 coc.nvim 提供 Emmet 支持。

    1. 安装方法： `:CocInstall coc-emmet`

    1. 配置：

    ```json
    "emmet.includeLanguages": {"vue-html": "html", "javascript": "javascripttreact"},
    "emmet.excludeLanguages": ["markdown"],
    "emmet.optimizeStylesheetParsing": false
    ```

	配合 https://github.com/mattn/emmet-vim 使用。

	具体配置请参阅： https://github.com/neoclide/coc-emmet

1. coc-html

    1. 为 coc.nvim 提供 Html 代码提示后端

    1. 安装方法： `:CocInstall coc-html`

    1. 配置：

    ```json
    "html.enable": true,
    "html.trace.server": "messages",
    "html.filetypes": ["html","handlebars","htmldjango","blade","phtml"],
    "html.format.enable": true,
    "html.format.unformatted": null,
    "html.format.contentUnformatted": "pre,code,textarea",
    "html.format.indentInnerHtml": true,
    "html.suggest.html5": true,
    "html.autoClosingTags": true,
    ```

	具体配置请参阅： https://github.com/neoclide/coc-html

1. coc-jedi

    1. coc.nvim 对于 Python 代码提示的插件，基于 [jedi-language-server](https://github.com/pappasam/jedi-language-server)。

    1. 安装：
        * 安装 jedi-language-server：
            ```bash
            pip install -U jedi-language-server
            ```
            参考： https://github.com/pappasam/jedi-language-server#user-content-installation
        * 安装 python3-venv ：
            ```bash
            sudo apt-get install -y python3-venv
            ```
        * 安装 coc-jedi ： `:CocInstall coc-jedi`

    1. 配置：
        ```json
        "jedi.enable": true,
        "jedi.startupMessage": "messages",
        "jedi.markupKindPreferred": "plaintext",
        "jedi.trace.server": true,
        "jedi.jediSettings.autoImportModules": [],
        "jedi.executable.command": "jedi-language-server",
        "jedi.executable.args": [],
        "jedi.completion.disableSnippets": false,
        "jedi.diagnostics.enable": true,
        "jedi.diagnostics.didOpen": true,
        "jedi.diagnostics.didChange": true,
        "jedi.diagnostics.didSave": true
	    ```
        具体配置请参阅： https://github.com/pappasam/coc-jedi

1. coc-json

    1. coc.nvim 的 Json 语言服务端扩展。

    1. 安装： :CocInstall coc-json

    1. 配置：

    ```json
    "json.enable": true,
    "json.trace.server": "messages",
    "json.format.enable": true
    ```

	具体配置请参阅： https://github.com/neoclide/coc-json

1. coc-phpactor

    1. 把 CoC 与 Phpactor 集成起来的扩展。使用它之前需要安装 Phpactor。

    1. 安装： :CocInstall coc-phpactor

    1. 配置：

    ```json
    "phpactor.enable": true,
    "phpactor.path": "~/.vim/bundles/phpactor/bin/phpactor",
    "languageserver": {
        "phpactor": {
            "command": "phpactor",
            "args": ["language-server"],
            "trace.server": "verbose",
            "filetypes": ["php"]
        }
    }
    ```
	了解更多请访问： https://github.com/phpactor/coc-phpactor

1. coc-sh

    1. SH 语言使用 [bash-language-server](https://github.com/mads-hartmann/bash-language-server) 作为服务端的 CoC 扩展。

    1. 安装：
        * 安装 bash-language-server ：
            ```bash
            sudo npm i -g bash-language-server
            ```
        参阅： https://github.com/bash-lsp/bash-language-server
        * 安装 coc-sh： :CocInstall coc-sh

    1. 配置：
        ```json
        "sh.enable": true
        "languageserver": {
            "bash": {
              "command": "bash-language-server",
              "args": ["start"],
              "filetypes": ["sh"],
              "ignoredRootPaths": ["~"]
            }
        }
        ```
        了解更多请访问： https://github.com/josa42/coc-sh

1. coc-sql

    1. coc.nvim 的 SQL 扩展。

    1. 安装：
        * 安装 [sql-formatter](https://github.com/zeroturnaround/sql-formatter) 和 [node-sql-parser](https://github.com/taozhi8833998/node-sql-parser)
            ```bash
            sudo npm install -g sql-formatter
            sudo npm install node-sql-parser --save
            ```
        * 安装 coc-sql： :CocInstall coc-sql
    1. 配置：
        将以下内容放进 `coc-extensions.conf.vim` 文件中：
        ```vim
        xmap <leader>F  <Plug>(coc-format-selected)
        nmap <leader>F  <Plug>(coc-format-selected)
        ```
        了解更多请访问： https://github.com/fannheyward/coc-sql

1. coc-tsserver

    1. coc.nvim 的 Javascript 与 TypeScript 语言服务端。

    1. 安装：
        * 安装 yarn （>= v2.0.0-rc.36）：
    	    ```bash
            # 今天是 2020-09-01，yarn 版本尚未升级到 v2.0.0+
            sudo npm install -g yarn
    	    ```
        * 安装 coc-tsserver ： CocInstall coc-tsserver

    1. 配置：
        ```json
        "tsserver.enable": true,
        "tsserver.locale": "",
        "tsserver.trace.server": "messages",
        "tsserver.npm": "/usr/local/bin/npm",
        "javascript.format.enabled": true,
        "javascript.showUnused": true,
        "javascript.updateImportsOnFileMove.enable": true
        ```
        更多配置选项在： https://github.com/neoclide/coc-tsserver

1. coc-vimlsp

    1. coc.nvim 的 Vim 语言后端。

    1. 安装： :CocInstall coc-vimlsp

    1. 配置：
        * 在 `coc-extensions.conf.vim` 文件中添加：
        ```vim
        let g:markdown_fenced_languages = [
                  \ 'vim',
                  \ 'help'
                  \]
        ```
        * 在 `cos-settings.json` 文件中追加：
        ```json
        "vimlsp.trace.server": "messages",
        "vimlsp.debug": false,
        "vimlsp.indexes.projectRootPatterns": [".git", "autoload", "plugin",".root"]
        ```
        更多信息请访问： https://github.com/iamcco/coc-vimlsp

其他的 Cos 扩展列表在： https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions

## 创建 undodir 目录(用于通过插件来保存文件修改记录)

```bash
mkdir ~/.vim/undodir
```

## 如果只想配置 YCM

先安装以下依赖，然后就参考前面所撰写的步骤：

```bash
sudo apt-get install -y build-essential cmake python3-dev npm nodejs python3 python3-pip openjdk-8-jdk --fix-missing
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

本人的 Vim 配置就此配置完成，工作平台是 Ubuntu 20.04 for WSL 2。其他操作系统上尚未尝试过，若你需要在其他操作系统上配置，那么就要参考 Github 上面以及网络上的资料进行了。
