"BASIC CONFIGURATION {{{
set nocompatible
filetype plugin indent on
syntax enable

set number relativenumber
set path+=**
set wildmode=longest,list,full
set encoding=UTF-8
set hidden
set nohlsearch
set incsearch
set scrolloff=8
set signcolumn=yes
set showmatch
set cursorline
set linebreak
set ignorecase
set smartcase
set clipboard+=unnamedplus
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set spelllang=en_us
set fillchars+=eob:\
set guifont=firacode\ nf:h13
set wrap
set foldenable
set foldmethod=marker
set foldmarker={{{,}}}
"}}}

"BASIC STYLING{{{
highlight Comment cterm=italic
highlight CursorLine ctermbg=Black cterm=NONE
highlight CursorLineNr ctermbg=Black cterm=bold ctermfg=Green
highlight LineNr ctermbg=Black ctermfg=White
colorscheme gruvbox
"}}}

"BASIC KEY BINDING{{{
"Remap Esc Key
inoremap jk <esc>
vnoremap jk <esc>
nnoremap <left> :tabp <cr>
nnoremap <right> :tabn <cr>

"Map leader key
let mapleader=","

"Map moving cursor
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

"Soure % and edit init file
nnoremap <leader>sv :source%<cr>
nnoremap <leader>ev :vsplit<cr> :edit $MYVIMRC<cr>
nnoremap ter :split<cr> <c-w>j :ter powershell<cr>a
nnoremap <esc> <c-\><c-n>
nnoremap <leader>g :PluginInstall<cr>
"}}}

"Plugin Install {{{

set rtp+=C:/Users/tuanc/AppData/Local/nvim/Vundle.vim
call vundle#begin('C:/Users/tuanc/AppData/Local/nvim/Vundle.vim')
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/syntastic'
Plugin 'nvim-telescope/telescope.nvim'
Plugin'nvim-lua/plenary.nvim'
Plugin 'gruvbox-community/gruvbox'

"Web development
Plugin 'ap/vim-css-color'
Plugin 'mattn/emmet-vim'

"Fancy stuff
Plugin 'vim-airline/vim-airline'
Plugin	'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'dracula/vim',{'name':'dracula'}
Plugin 'flazz/vim-colorschemes'
call vundle#end()
"}}}

"VIM AIRLINE CONFIG{{{
let g:airline#extensions#tabline#enabled=1
let g:airline_themes='gruvbox'
"}}}

"NERDTREE CONFIG{{{
nnoremap <leader>n :NERDTreeFocus<cr>
nnoremap <c-t> :NERDTreeToggle<cr>
nnoremap <c-f> :NERDTreeFind<cr>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"}}}
 
"TELESCOPE CONFIG{{{
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"}}}




