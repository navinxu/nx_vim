" ncm2 config
"" Set the PHP bin to an additional installation that has no XDEBUG installed
""" let g:phpactorPhpBin = '/usr/bin/php'

"" Make ncm2 work automatically
" autocmd BufEnter * call ncm2#enable_for_buffer()

"" When autocompleting auto select the first one and do not autoinsert.
" set completeopt=noinsert,menuone

"" Enable tab cyle thorought suggestions.
"" ctrl + j: Next item (down).
"" ctrl + k: Previous item (up).
""" inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : "\<Tab>"
""" inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"" When pressing CTRL+u on a suggestion, it will expand with parameters.
" noremap <silent> <expr> <c-x><c-o> ncm2_ultisnips#expand_or("\<CR>", 'n')

"" Tab and Shift-Tab will cycle thorough parameters.
"" let g:UltiSnipsJumpForwardTrigger="<tab>"
"" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
" let $NVIM_PYTHON_LOG_LEVEL="DEBUG"


"" PHP7
let g:ultisnips_php_scalar_types = 1
augroup ncm2
au!
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
au User Ncm2PopupClose set completeopt=menuone
augroup END
" parameter expansion for selected entry via Enter
inoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>")
" cycle through completion entries with tab/shift+tab
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"
" END
