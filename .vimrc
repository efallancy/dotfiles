set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

" Recursive path traversal
set path+=**

" Set line number
set number

" Set backup to none
set nobackup
set noswapfile

" Space indentation
set tabstop=2
set shiftwidth=2
set expandtab

" OSX weird behaviour using backspace
set backspace=indent,eol,start

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'haishanh/night-owl.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-salve'
Plugin 'mattn/emmet-vim'
Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on

" Night-owl theme
if (has("termguicolors"))
  set termguicolors
endif

syntax enable
colorscheme night-owl

"For NerdTree toggle
map <C-n> :NERDTreeToggle<CR>

" Split pane keymap
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

