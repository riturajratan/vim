" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line"


"set html auto complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"set php auto complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"set css auto complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"set javascript auto complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" You might also find this useful
" PHP Generated Code Highlights (HTML & SQL)

"let php_sql_query=1
"let php_htmlInStrings=1

" Hope this helps!
"by below we set neocomplete
"let g:neocomplete#enable_at_startup = 1
"below code set for extend php envioument
"autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP


call pathogen#infect()
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"by this number comes
set number
"by this indentation come
filetype indent on

"by this searching improve
set ignorecase " case insensitive
set smartcase  " use case if any caps used
set incsearch  " show match as search proceeds
set hlsearch   " search highlighting

"Show hidden files in NerdTree
let NERDTreeShowHidden=1

"autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
"this all below set indentation on vim
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set wildmenu

"set status line in with showing status
set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
"set wmw=0
"nmap <c-h> <c-w>h<c-w><Bar>
"nmap <c-l> <c-w>l<c-w><Bar>

"to open tagbar in vim
nmap <F8> :TagbarToggle<CR>

"syntax highlighting
syntax on

"to php documentation
source ~/.vim/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

augroup vimrc_autocmd
    autocmd!
    "toggle quickfix window
    autocmd BufReadPost quickfix map <buffer> <leader>qq :cclose<cr>|map <buffer> <c-p> <up>|map <buffer> <c-n> <down>

    autocmd FileType unite call s:unite_settings()
    " obliterate unite buffers (marks especially).
    autocmd BufLeave \[unite\]* if "nofile" ==# &buftype | setlocal bufhidden=wipe | endif

    " Jump to the last position when reopening a file
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

    " ...etc...

augroup END


" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \     execute 'normal! g`"zvzz' |
                \ endif
augroup END

"load javascript libraries 
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 0
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
" for neo complete plugin we need to enable lua suppor we can insatll it by

" sudo apt-get install lua50 liblua50-dev liblualib50-dev
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
