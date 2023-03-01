syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set number relativenumber
set wildmode=longest,list,full
set clipboard+=unnamedplus
set scrolloff=5

let mapleader=","

call plug#begin('~/.vim/plugged')

Plug 'xuhdev/vim-latex-live-preview'
"Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'preservim/nerdtree'
Plug 'turbio/bracey.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'conornewton/vim-pandoc-markdown-preview'
Plug 'cespare/vim-toml', { 'branch':'main' }

call plug#end()

inoremap jk <Esc>
inoremap kj <Esc>
inoremap jK <Esc>
inoremap Jk <Esc>
inoremap JK <Esc>
inoremap Kj <Esc>
inoremap kJ <Esc>
inoremap KJ <Esc>
inoremap { {}<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap " ""<left>
inoremap ' ''<left>
inoremap $ $$<left>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <F3> :set hlsearch!<CR>
nnoremap j gj
nnoremap k gk
nnoremap >> <<
nnoremap << >>
nnoremap <leader>p "+p
nnoremap <leader>o <C-^>
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

map <leader>n :NERDTreeToggle<CR>
inoremap <leader>n <esc>:NERDTreeToggle<CR>
map <leader>s :update<CR>
inoremap <leader>s <esc>:update<CR>


""MOUSE
set mouse=a

""AUTO CMDS

"LATEX

autocmd FileType tex nnoremap <buffer> j gj
autocmd FileType tex nnoremap <buffer> k gk
autocmd FileType tex map <buffer> <F9> :w<CR>:exec '!pdflatex -interacion=nonstopmode > /tmp/tmp.log 2>&1' shellescape(@%, 1)<CR>
autocmd FileType tex imap <buffer> <F9> <esc>:w<CR>:exec '!pdflatex -interaction=nonstopmode > /tmp/tmp.log 2>&1' shellescape(@%, 1)<CR>
autocmd FileType tex nnoremap <buffer> <leader>l <C-W>s:e /tmp/tmp.log<CR>
autocmd FileType tex inoremap <buffer> <leader>l <C-W>s:e /tmp/tmp.log<CR>

"PYTHON

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python nnoremap <leader>c :echo getline(search('class ', 'bn'))<CR>
autocmd FileType python nnoremap <leader>f :echo getline(search('def ', 'bn'))<CR>

"SHELL

autocmd FileType sh map <buffer> <F9> :w<CR>:!./%<CR>
autocmd FileType sh imap <buffer> <esc><F9> :w<CR>:!./%<CR>

"JAVASCRIPT"
autocmd FileType javascript noremap <buffer> <F9> :w<CR>
autocmd FileType javascript imap <buffer> <F9> <esc>:w<CR>

"C

autocmd FileType c map <buffer> <F8> :w<CR>:exec 'make all' shellescape(@%, 1)<CR>
autocmd FileType c imap <buffer> <F8> <esc>:w<CR>:exec 'make all' shellescape(@%, 1)<CR>
autocmd FileType c map <buffer> <F9> :w<CR>:exec 'make download' shellescape(@%, 1)<CR>
autocmd FileType c imap <buffer> <F9> <esc>:w<CR>:exec 'make download' shellescape(@%, 1)<CR>

"MARKDOWN

autocmd FileType markdown map <buffer> <F9> :w<CR>
autocmd FileType markdown imap <buffer> <F9> <esc>:w<CR>

"fzf
nnoremap <C-p> :Files<Cr>
nmap <silent> <leader>a :History<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir=["~/.vim/plugged/vim-snippets"]
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
