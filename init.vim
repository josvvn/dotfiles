
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

if has('nvim') || has('termguicolors')
  set termguicolors
endif

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'junegunn/limelight.vim' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/incsearch.vim'
Plug 'psliwka/vim-smoothie'
Plug 'itchyny/lightline.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'vimwiki/vimwiki'
call plug#end()

colorscheme challenger_deep
set background=dark

let g:asmsyntax = "masm"
let g:lightline = { 'colorscheme': 'challenger_deep'}
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

let mapleader = " "
 

" NERDTree starts automatically when open Vim in a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" My Keybindings
nnoremap <C-p> :NERDTreeToggle<CR>
nnoremap <C-j> :tabp<CR>
nnoremap <C-k> :tabn<CR>
" Redirect all delete-operations to black-hole
" Use 'm' ("move") for all cut-operations
nnoremap d "_d
nnoremap m d
"nnoremap <leader>p "_dP

nnoremap <silent> <Leader>; :vertical resize +5<CR>
nnoremap <silent> <Leader>' :vertical resize -5<CR>

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

set guifont=Perfect\ DOS\ VGA\ 437\ Win:h21 "for Neovide
