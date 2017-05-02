set nocompatible              " be iMproved, required
set encoding=utf-8
set fileencoding=utf-8
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'VundleVim/Vundle.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'StanAngeloff/php.vim'
Bundle 'scrooloose/vim-fugitive'
Bundle 'tomasr/molokai'
Bundle "bling/vim-airline"
Bundle "kien/ctrlp.vim"
Bundle 'Raimondi/delimitMate'
Bundle 'fatih/vim-go'
Bundle 'scrooloose/syntastic'

call vundle#end()            " required
"filetype plugin indent on    " required

"colorscheme elflord
"colorscheme molokai
colorscheme monokai
set nu
set mouse=vi
syntax on  "~G�~J�语~U~X亮
syntax enable 
set cursorline     "当前行高亮
set hlsearch 
set autoindent
set expandtab    " 将制表符扩展为空格
set tabstop=4   " 设置编辑时制表符占用空格数
set scrolloff=5
set ruler

" ======= syntastic ========= "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args=' --standard=PSR2 -n'

"molokai scheme
"let g:molokai_original = 1
"let g:rehash256 = 1
" 按下 F2 调出/隐藏 NERDTree
map <F2> :NERDTreeToggle<CR>
" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
 "autocmd VimEnter * NERDTree

"php.vim
"let g:php_syntax_extensions_enabled = 1
"let b:php_syntax_extensions_enabled = 1
"function! PhpSyntaxOverride()
"    hi! def link phpDocTags  phpDefine
"    hi! def link phpDocParam phpType
"endfunction
"
"augroup phpSyntaxOverride
"	autocmd!
"    autocmd FileType php call PhpSyntaxOverride()
"augroup END

