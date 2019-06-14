set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

" Encoding
set encoding=utf-8
set fileencoding=utf-8

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

" Ignore case
set ignorecase

" OSX weird behaviour using backspace
set backspace=indent,eol,start

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'bcicen/vim-vice'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-salve'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'w0rp/ale'
Plugin 'jiangmiao/auto-pairs'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-surround'
Plugin 'luochen1990/rainbow'
Plugin 'leafgarland/typescript-vim'
Plugin 'quramy/tsuquyomi'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'alx741/vim-hindent'
Plugin 'mhinz/vim-grepper'
Plugin 'kyuhi/vim-emoji-complete'
Plugin 'pangloss/vim-javascript'
Plugin 'reasonml-editor/vim-reason-plus'

call vundle#end()
filetype plugin indent on

" Theming colour config
if (has("termguicolors"))
  set termguicolors
endif

syntax enable
set background=dark
colorscheme vice

"For NerdTree toggle
map <C-n> :NERDTreeToggle<CR>

" Split pane keymap
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ALE linting
let g:airline#extensions#ale#enabled = 1 " Airline integration
let g:ale_sign_error = "❗️"
let g:ale_sign_warning= "💩"
let g:ale_line_on_enter = 0
let g:ale_linters_ignore = {'typescript': ['tslint']}

highlight clear ALEErrorSign
highlight clear ALEWarningSign

" Ctrl-P Fuzzy Finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['line']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" Rainbow Parentheses
let g:rainbow_active = 1

" vim-typescript
let g:typescript_ignore_typescriptdoc = 0

" vim-hindent
let g:hindent_on_save = 0
