
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

if has('nvim') || has('termguicolors')
  set termguicolors
endif

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
Plug 'junegunn/limelight.vim' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/incsearch.vim'
Plug 'psliwka/vim-smoothie'
Plug 'itchyny/lightline.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'michal-h21/vim-zettel'
call plug#end()

colorscheme challenger_deep
set background=dark

let $PATH = "C:\\Program Files\\Git\\usr\\bin;" . $PATH  " preview in FZF was not working so this was needed (at least on windows)

let g:vimwiki_list = [{'zettel_template': "./zettel_template.tpl",
                \ 'syntax': 'markdown', 'ext': '.md', 'custom_wiki2html': 'vimwiki_markdown',
                \ 'html_filename_parameterization': 1, 'template_ext': '.tpl'}]

let g:asmsyntax = "masm"
let g:lightline = { 'colorscheme': 'challenger_deep'}
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
"let g:zettel_options = [{"template" :  "./zettel_template.tpl"}]
let g:zettel_random_chars = 4
let g:zettel_format = "%d%m%y%random %title"
let g:zettel_date_format = "%d-%m-%y"
let g:zettel_link_format="[[%link|*%title*]]"
"let g:zettel_link_format="[*%title*](%link)"

let g:zettel_default_mappings = 0
augroup filetype_vimwiki
    autocmd!
    autocmd FileType vimwiki imap <silent> ]] ]]<esc><Plug>ZettelSearchMap
    autocmd FileType vimwiki nmap T <Plug>ZettelYankNameMap
    autocmd FileType vimwiki xmap z <Plug>ZettelNewSelectedMap
    autocmd FileType vimwiki nmap gZ <Plug>ZettelReplaceFileWithLink
    autocmd Filetype vimwiki nmap <BS> <Plug>VimwikiGoBackLink
augroup END

let mapleader = " "
 
" NERDTree starts automatically when open Vim in a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" My Keybindings
nnoremap <C-p> :NERDTreeToggle<CR>
nnoremap <C-j> :tabp<CR>
nnoremap <C-k> :tabn<CR>
nnoremap <leader>zn :ZettelNew<space>

nmap <leader>[ <Plug>VimwikiGoBackLink
nmap <C-i> <Plug>VimwikiIndex
" Redirect all delete-operations to black-hole
" Use 'm' ("move") for all cut-operations
nnoremap d "_d
vnoremap d "_d
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

set guifont=Iosevka\ Term\ SS04\ Medium:h21
