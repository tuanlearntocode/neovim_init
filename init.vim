"BASIC CONFIGURATION {{{
set nocompatible
filetype plugin indent on
syntax enable

set number relativenumber
set path+=**
set wildmode=longest,list,full
set completeopt=longest,menuone
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
set fillchars=vert:' 
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
nnoremap <c-\> :vsplit<cr>
"}}}

"Plugin Install {{{

set rtp+=C:/Users/tuanc/AppData/Local/nvim/Vundle.vim
call vundle#begin('C:/Users/tuanc/AppData/Local/nvim/Vundle.vim')
Plugin 'VundleVim/Vundle.vim'
Plugin 'xiyaowong/nvim-transparent'
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
":CocInstall coc-tsserver coc-html coc-css coc-emmet
"Phải install mấy cái ở trên mới có gợi ý 

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

"Practice vim
Plugin 'ThePrimeagen/vim-be-good'
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

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
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

"NEOVIM-TRANSPARENT CONFIGURATION{{{
let g:transparent_enabled=v:true
"}}}
