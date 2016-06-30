set nocompatible
filetype off

" Define a more sane leader key
let mapleader = ","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin for Dracula Theme
Plugin 'scrooloose/nerdtree'
" SnipMate Stuff
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'Shougo/neocomplete'
" END SnipMate Stuff
" vim-go
Plugin 'fatih/vim-go'
" END vim-go
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Basic Stuff
set encoding=utf-8
set title
set linebreak
set showmode
set showcmd
set expandtab
set shiftwidth=4
set tabstop=4
set nowrap
set autoindent
set ruler
set backspace=indent,eol,start
syntax on
set relativenumber
set showmatch
set si
set ignorecase

" Set timeout to make VIM sane
set notimeout
set ttimeout
set ttimeoutlen=10

" Define a more sane leader key
let mapleader = ","

" Clean trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Uppercase Word" stolen from:
" https://bitbucket.org/sjl/dotfiles/src/1ff33bef59847fa2fcec2e172e16c010080923dd/vim/vimrc?at=default&fileviewer=file-view-default
inoremap <C-u> <esc>mzgUiw`za

let g:neocomplete#enable_at_startup = 1
