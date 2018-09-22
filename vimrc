if filereadable(expand("~/.vim/vimrc.base"))
    source ~/.vim/vimrc.base
endif

if filereadable(expand("~/.vim/vimrc.keymap"))
    source ~/.vim/vimrc.keymap
endif

if filereadable(expand("~/.vim/vimrc.bundles"))
    source ~/.vim/vimrc.bundles
endif

if filereadable(expand("~/.vim/vimrc.plugin.conf"))
    source ~/.vim/vimrc.plugin.conf
endif
