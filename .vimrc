" Rich 2012
" Refer:
" https://github.com/spf13/spf13-vim 
" Essentials
set nocompatible
call pathogen#infect()
call pathogen#helptags()


" Directories
set nobackup
set noswapfile
if has('persistent_undo')
	set undofile
	set undolevels=1000
	set undoreload=10000
endif

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

" Formatting 
filetype plugin indent on
syntax on               
set nowrap
set textwidth=0 " required to avoid wrapping, apparently
set autoindent
set shiftwidth=4
set tabstop=4  
set softtabstop=4
set fillchars=vert:\ ,stl:\ ,stlnc:\ , " note: trailling comma required
set statusline=\ %t\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" Colours
set background=dark
set t_Co=256
colorscheme ir_black
highlight VertSplit cterm=NONE ctermbg=NONE
highlight StatusLine cterm=NONE ctermfg=Yellow ctermbg=DarkRed
highlight StatusLineNC cterm=NONE ctermfg=Black ctermbg=DarkGrey

" Keys
let mapleader = ','
nmap <leader>ev :e $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>
map <Leader>p <C-^>
map <Leader>w :w<CR>
map <Leader>q :q<CR>
map <Leader>wq :wq<CR>
imap jj <Esc> 

" Move between windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Move within a wrapped line 
nnoremap j gj
nnoremap k gk

" Working directory
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Indent without leaving visual mode
vnoremap < <gv
vnoremap > >gv

" Even out window size
map <Leader>= <C-w>=

" Ctags 
set tags=./tags;/,~/.vimtags
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <Leader>t :TlistToggle<cr>
map <Leader>j <C-]>

" SnipMate 
let g:snips_author = 'Rich Churcher <rich.churcher@gmail.com>'

" NerdTree 
map <leader>n :NERDTreeToggle<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeShowHidden=1
let NERDTreeDirArrows=0

" Fugitive 
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

