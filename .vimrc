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

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'lyuts/vim-rtags'
Plug 'ycm-core/YouCompleteMe'
Plug 'OmniSharp/omnisharp-vim'
Plug 'scrooloose/syntastic'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'

call plug#end()

colorscheme gruvbox
set background=dark

let &t_SI = "\<esc>[5 q" " I beam cursor for insert mode
let &t_EI = "\<esc>[2 q" " block cursor for normal mode
let &t_SR = "\<esc>[3 q" " underline cursor for replace mode

" NERDTree starts automatically when open Vim in a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Use the stdio version of OmniSharp-roslyn:
let g:OmniSharp_server_stdio = 1

" Key mapping
let mapleader = " "
"nnoremap <leader>h : wincmd h <CR>
"nnoremap <leader>j : wincmd j <CR>
"nnoremap <leader>k : wincmd k <CR>
"nnoremap <leader>l : wincmd l <CR>
nnoremap <silent> <Leader>gh :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
nnoremap <C-p> :NERDTreeToggle<CR>
nnoremap <C-j> :tabr<CR>
nnoremap <C-k> :tabl<CR>
