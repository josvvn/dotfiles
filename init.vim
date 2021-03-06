set runtimepath^=~/.vim/bundle/ctrlp.vim
set nocompatible
filetype plugin on
syntax on

set noerrorbells
set noshowmode
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu rnu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set clipboard=unnamed " Vim and System clipboard are the same
set runtimepath^=$NVIM_HOME/bundle/ctrlp.vim

if has('nvim') || has('termguicolors')
  set termguicolors
endif

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

" ========= Code Completion ========
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
" ==================================

" ============ Utility =============
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/incsearch.vim'
Plug 'psliwka/vim-smoothie'
Plug 'junegunn/limelight.vim' 
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'
" ==================================


" =========== Aesthetics ===========
Plug 'itchyny/lightline.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
" ==================================

call plug#end()

colorscheme challenger_deep
set background=dark

let g:asmsyntax = "masm"
let g:lightline = { 'colorscheme': 'challenger_deep'}
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:ctrlp_map = '<leader> P'

let mapleader = " "

" ======================== My Keybindings =====================
nnoremap <C-p> :NERDTreeToggle<CR>
nnoremap <C-j> :tabp<CR>
nnoremap <C-k> :tabn<CR>
nnoremap <leader>zn :ZettelNew<space>

nmap <leader>[ <Plug>VimwikiGoBackLink
nmap <C-i> <Plug>VimwikiIndex
nnoremap d "_d
vnoremap d "_d
nnoremap m d

nnoremap <silent> <Leader>; :vertical resize +5<CR>
nnoremap <silent> <Leader>' :vertical resize -5<CR>

" Generate ctags silently
nnoremap <leader>tt :silent !ctags -R . <CR>:redraw!<CR> 
" Go to index of notes and set working directory to my notes
nnoremap <leader>ni :e $NOTES_DIR/index.md<CR>:cd $NOTES_DIR<CR>


" =============================================================


" ======================== Plugin Default Config/Keybindings =====================

" ============================= CoC ==============================

" CoC completion
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

" ===============================================================


" ========================== Vimwiki ============================

let g:vimwiki_list = [{'path': '~/vimwiki', 'template_path': '~/vimwiki/templates/',
          \ 'template_default': 'default', 'syntax': 'markdown', 'ext': '.md',
          \ 'path_html': '~/vimwiki/site_html/', 'custom_wiki2html': 'vimwiki_markdown',
          \ 'html_filename_parameterization': 1,
          \ 'template_ext': '.tpl'}]

augroup filetype_vimwiki
    autocmd!
    autocmd FileType vimwiki imap <silent> ]] ]]<esc><Plug>ZettelSearchMap
    autocmd FileType vimwiki nmap T <Plug>ZettelYankNameMap
    autocmd FileType vimwiki xmap z <Plug>ZettelNewSelectedMap
    autocmd FileType vimwiki nmap gZ <Plug>ZettelReplaceFileWithLink
    autocmd Filetype vimwiki nmap <BS> <Plug>VimwikiGoBackLink
augroup END

" ===============================================================

" =========================== Emmet =============================

let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" ===============================================================

" ========================== NERDTree ===========================

" NERDTree starts automatically when open Vim in a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" ===============================================================

" ========================== Vim-Zettel =========================

let g:zettel_options = [{"template" :  './zettel_template.tpl'}]
let g:zettel_random_chars = 4
let g:zettel_format = "%d%m%y%random %title"
let g:zettel_date_format = "%d-%m-%y"
let g:zettel_link_format="[%title](%link)"

let g:zettel_default_mappings = 0

" ===============================================================

" ================================================================================
 

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

set guifont=Iosevka\ Term\ SS04\ Medium:h21
