set nocompatible              " be iMproved, required
set encoding=utf-8
set fileencoding=utf-8
" filetype off                  " required
"filetype plugin indent on

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
Bundle 'majutsushi/tagbar'
" Bundle 'yonchu/accelerated-smooth-scroll'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-easymotion'

call vundle#end()            " required
"filetype plugin indent on    " required

colorscheme monokai
set nu
set mouse=vi
syntax on  "~G�~J�语~U~X亮
syntax enable 
set cursorline     "当前行高亮
"hi CursorLine cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE    "高亮行颜色
set hlsearch 
hi Search ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
set autoindent
set expandtab    " 将制表符扩展为空格
set tabstop=4   " 设置编辑时制表符占用空格数
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

