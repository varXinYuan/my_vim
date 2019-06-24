set nocompatible              " be iMproved, required
set encoding=utf-8
set fileencoding=utf-8
filetype on
filetype plugin on
filetype indent on

" tmux设置 BEGIN
if exists('$TMUX')
  set term=screen-256color
endif
if exists('$ITERM_PROFILE')
  if exists('$TMUX') 
    let &t_SI = "<Esc>[3 q"
    let &t_EI = "<Esc>[0 q"
  else
    let &t_SI = "<Esc>]50;CursorShape=1x7"
    let &t_EI = "<Esc>]50;CursorShape=0x7"
  endif
end
" tmux设置 END

" ======= Vundle =======
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'VundleVim/Vundle.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'StanAngeloff/php.vim'
Bundle 'scrooloose/vim-fugitive'
Bundle 'tomasr/molokai'
Bundle "bling/vim-airline"
Bundle "kien/ctrlp.vim"
Bundle "tacahiroy/ctrlp-funky"
Bundle 'Raimondi/delimitMate'
Bundle 'fatih/vim-go'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
" Bundle 'yonchu/accelerated-smooth-scroll'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Chiel92/vim-autoformat'
Bundle 'neovimhaskell/haskell-vim'

call vundle#end()

colorscheme monokai
set nu
set mouse=vi
syntax on  "语法高亮
syntax enable
set cursorline     "当前行高亮
"hi CursorLine cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE    "高亮行颜色
set hlsearch
hi Search ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
set autoindent
set expandtab    " 将制表符扩展为空格
set tabstop=4   " 设置编辑时制表符占用空格数
set shiftwidth=4
set scrolloff=5
set ruler
" set background=dark

" ========Tagbar======== "
nmap <F9> :TagbarToggle<CR>
" 启动时自动focus
"let g:tagbar_autofocus = 1

" ======= 缩进显示 ======== "
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_guide_size = 1
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
" hi IndentGuidesOdd  ctermbg=black


" ========= 高亮不妥当的空格和tab =========
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<

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

" auto-formater
noremap <F3> :Autoformat<CR>

" 禁用某些文件的符号自动补全
au FileType csv let b:delimitMate_autoclose = 0

" 底部状态栏显示路径等详细信息
"set laststatus=2      " 总是显示状态栏
"highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
" 获取当前路径，将$HOME转化为~
"function! CurDir()
"    let curdir = substitute(getcwd(), $HOME, "~", "g")
"    return curdir
"endfunction
"set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\

" 或以下两句
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "显示文件名：总行数，总的字符数
set ruler "在编辑过程中，在右下角显示光标位置的状态行

" ctrlp
" 搜索隐藏文件
let g:ctrlp_show_hidden = 1

" CtrlPFunky
" narrow the list down with a word under cursor
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']

"进行版权声明的设置
"添加或更新头
map <F4> :call TitleDet()<cr>'s
function AddTitle()
    call append(1,"/*=============================================================================")
    call append(2,"#")
    call append(3,"# Author: Jerry Lee")
    call append(4,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(5,"# Filename: ".expand("%:t"))
    call append(6,"#")
    call append(7,"=============================================================================*/")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
"更新最近修改时间和文件名
function UpdateTitle()
    normal m'
    execute '/# *Last modified:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=": ".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()
    let n=1
    "默认为添加
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction

" haskell syntax
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords"
