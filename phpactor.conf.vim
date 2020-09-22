" phpactor config
"" Set the PHP bin to an additional installation that has no XDEBUG installed
let g:phpactorPhpBin = '/usr/bin/php'
let g:phpactorBranch = 'master'
let g:phpactorOmniAutoClassImport = v:true

autocmd FileType php setlocal omnifunc=phpactor#Complete
let g:phpactorCompletionIgnoreCase = 0
let g:phpactorOmniError = v:true

" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>
nmap <Leader>vo :call phpactor#GotoDefinitionVsplit()<CR>
nmap <Leader>ho :call phpactor#GotoDefinitionHsplit()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
" nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
" END of phpactor config
