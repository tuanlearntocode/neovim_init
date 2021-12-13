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
set fillchars+=eob:~
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
nnoremap <leader>f :Telescope buffers<cr>
nnoremap <leader>g :PluginInstall<cr>
nnoremap <right> :tabn<cr>
nnoremap <left> :tabp<cr>
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
Plugin 'nvim-lua/plenary.nvim'
Plugin 'gruvbox-community/gruvbox'
Plugin 'hrsh7th/nvim-compe'
Plugin 'neoclide/coc.nvim', {'branch':'release'}

"Web development
Plugin 'ap/vim-css-color'
Plugin 'alvan/vim-closetag'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

"Fancy stuff
Plugin 'vim-airline/vim-airline'
Plugin	'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'dracula/vim',{'name':'dracula'}
Plugin 'flazz/vim-colorschemes'

"Latex
Plugin 'xuhdev/vim-latex-live-preview'
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
let g:NERDTreeDirArrowExpandable = '->'
let g:NERDTreeDirArrowCollapsible = '~'
"}}}
 
"TELESCOPE CONFIG{{{
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"}}}

"LATEX CONFIG{{{
let g:livepreview_previewer = 'your_viewer'
"}}}

"INSTALL COC-NVIM & CONFIGURATION{{{
"1. Install node
"2. Install yarn
"3. PluginInstall coc-nvim
"4. run "yarn install" in coc.nvim director
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"}}}

"VIM-TAG CONFIGURATION{{{
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
"}}}
