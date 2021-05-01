
syntax on

set noerrorbells
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
let g:asmsyntax = "masm"
set clipboard=unnamed " Vim and System clipboard are the same

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'junegunn/limelight.vim' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/incsearch.vim'
Plug 'psliwka/vim-smoothie'
call plug#end()

colorscheme gruvbox
set background=dark

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

let mapleader = " "
 
" NERDTree starts automatically when open Vim in a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" My Keybindings
nnoremap <C-p> :NERDTreeToggle<CR>
nnoremap <C-j> :tabr<CR>
nnoremap <C-k> :tabl<CR>

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

set guifont=Perfect\ DOS\ VGA\ 437\ Win:h18 "for Neovide
