#!/bin/bash
# **********************************************************
# * author        : navin xu
# * email         : admin@navinxu.com
# * create time   : 2020-09-01 16:03
# * last modified : 2020-09-01 16:03
# * filename      : coc-automation-script.sh
# * description   : 
# **********************************************************

# this file is from: https://github.com/neoclide/coc.nvim/wiki/install-coc.nvim

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

### # install latest nodejs
### if [ ! -x "$(command -v node)"  ]; then
###         curl --fail -lss https://install-node.now.sh/latest | sh
###             export path="/usr/local/bin/:$path"
###                 # or use apt-get
###                     # sudo apt-get install nodejs
### fi
### 
### # use package feature to install coc.nvim
### 
### # for vim8
### mkdir -p ~/.vim/pack/coc/start
### cd ~/.vim/pack/coc/start
### curl --fail -l https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -
### # for neovim
### # mkdir -p ~/.local/share/nvim/site/pack/coc/start
### # cd ~/.local/share/nvim/site/pack/coc/start
### # curl --fail -l https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -

# install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json  ]
then
      echo '{"dependencies":{}}'> package.json
fi
# change extension names to the extensions you need
npm install coc-snippets --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
