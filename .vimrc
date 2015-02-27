" Essentials
set nocompatible
"runtime bundle/vim-pathogen/autoload/pathogen.vim
"call pathogen#infect()
"call pathogen#helptags()
call plug#begin('~/.vim/plugged')

" Always
Plug 'jnurmine/Zenburn'
Plug 'twerth/ir_black'
Plug 'altercation/vim-colors-solarized'
Plug 'Lokaltog/vim-easymotion'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'kien/ctrlp.vim'
Plug 'floobits/floobits-neovim'

" On demand
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'Valloric/YouCompleteMe', { 'for': ['javascript', 'cs', 'html', 'go'] }

call plug#end()

set nobackup
set noswapfile

" UI
set history=1000
set hidden " switch buffers without saving
set backspace=indent,eol,start
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=list:longest,full
set whichwrap=b,s,h,l,<,>,[,]
set scrolljump=5
set scrolloff=3
set nolist
if has('gui_running')
	set go-=T
	set go-=r
	set go-=R
	set go-=m
	set go-=l
	set go-=L
	set go-=b
	colorscheme solarized
	hi link EasyMotionTarget CursorLineNr
	hi link EasyMotionShade Comment
endif

" Formatting
filetype plugin indent on
syntax on
set nowrap
set textwidth=0 " required to avoid wrapping, apparently
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set fillchars=vert:\ ,stl:\ ,stlnc:\ , " note: trailling comma required
set statusline=\ %t\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" Colours
set background=dark
colorscheme solarized

" Keys
inoremap jj <Esc>
let mapleader = ','
nmap <leader>ev :e $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>
map <Leader>p <C-^>
map <Leader>. :bn<CR>
map <Leader>bd :bd<CR>
map <Leader>w :w<CR>
map <Leader>q :q<CR>
" Datestamp
nmap <F3> a<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
" Move between windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
" Resize windows
map <A-,> <C-W><
map <A-.> <C-W>>
map <A-+> <C-W>+
map <A--> <C-W>-
map <A-=> <C-W>=

" Move within a wrapped line
nnoremap j gj
nnoremap k gk

" Working directory
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Indent without leaving visual mode
vnoremap < <gv
vnoremap > >gv

" Ctags
set tags=./tags;/,~/.vimtags
let Tlist_WinWidth = 50
let tlist_go_settings = 'go;f:func;p:package;t:type;c:const;v:var'
map <Leader>t :TlistToggle<cr>
map <Leader>j <C-]>
let g:easytags_dynamic_files = 1

" NerdTree
nmap <leader>n :NERDTreeToggle ~/work<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.hg', '\.svn', '\.bzr']
let NERDTreeShowHidden=1
let NERDTreeDirArrows=0

" Fugitive
set previewheight=30
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>

