syntax enable
set number ruler incsearch hlsearch
set ignorecase smartcase
set backspace=indent,eol,start
set cindent smartindent autoindent
set expandtab shiftwidth=4 softtabstop=4 tabstop=4
set list listchars=tab:>-,trail:-
set nowrap cursorline
set autoread autowrite
set laststatus=2

"include added plugins
filetype off
let &runtimepath.=',~/.vim/vim-colors-solarized,~/.vim/ale,~/.vim/neocomplete.vim,~/.vim/ctrlp.vim,~/.vim/nerdtree,~/.vim/taglist.vim,~/.vim/minibufexpl.vim'
filetype plugin on
filetype plugin indent on

"generate helptags automatically
silent! helptags ALL

" solarized colorscheme settings
colorscheme solarized
set background=dark

"ctags
set tags=~/tags

"omnifunc settings
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" taglist settings
let Tlist_Auto_Open = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth=30
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Process_File_Always=1

" NERDTree settings
let NERDTreeWinSize=30
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" neocomplete settings
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"ale
""始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0

"xdebug
let g:debuggerPort = 9005
let g:debuggerTimeout = 20
