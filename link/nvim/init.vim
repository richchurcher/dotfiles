" Essentials
call plug#begin('~/nvim/plugged')

" Always
Plug 'chriskempson/base16-vim'
Plug 'jnurmine/Zenburn'
Plug 'easymotion/vim-easymotion'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'jamshedVesuna/vim-markdown-preview'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-signify'
Plug 'rking/ag.vim'

" On demand
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'ternjs/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
Plug 'Shougo/deoplete.nvim', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'fatih/vim-go', { 'for': 'go' }

"Fiddly install for C#, sometimes handy in other languages... autocompleter
"Plug 'Valloric/YouCompleteMe', { 'for': ['javascript', 'cs', 'html'] }

call plug#end()

set nobackup
set noswapfile

" UI
set relativenumber
set number
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
	hi link EasyMotionTarget CursorLineNr
	hi link EasyMotionShade Comment
endif

" Formatting
filetype plugin indent on
syntax on
set nowrap
set textwidth=0 " required to avoid wrapping, apparently
set autoindent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set fillchars=vert:\ ,stl:\ ,stlnc:\ , " note: trailling comma required
set statusline=\ %t\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
let g:syntastic_javascript_checkers = ['standard']
autocmd bufwritepost *.js silent !standard-format --parser babel-eslint -w %
set autoread

" Colours
set background=dark
let base16colorspace=256
colorscheme base16-solarized
if has("win32unix")
  colorscheme zenburn
  " terminal cursor
  let &t_SI = "\<Esc>[4 q"
  let &t_EI = "\<Esc>[2 q"
  silent !echo -ne "\033]12;red\007"
  autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

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
map <Leader>l :set nu<CR>
map <Leader>ecd :e %:p:h
" Datestamp
nmap <F3> a<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
" Move between windows
" tnoremap <C-h> <C-\><C-n><C-w>h
" tnoremap <C-j> <C-\><C-n><C-w>j
" tnoremap <C-k> <C-\><C-n><C-w>k
" tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-p> :FZF<CR>
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

" Indent without leaving visual mode
vnoremap < <gv
vnoremap > >gv

" Ctags
set tags=./tags,tags;$HOME
let Tlist_WinWidth = 50
let tlist_go_settings = 'go;f:func;p:package;t:type;c:const;v:var'
map <Leader>t :TlistToggle<cr>
map <Leader>j <C-]>
let g:easytags_dynamic_files = 1

" Fugitive
set previewheight=30
let g:netrw_browsex_viewer = 'google-chrome'
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
map <leader>2 :diffget //2<CR>
map <leader>3 :diffget //3<CR>

" vim-go
let g:go_fmt_command = "goimports"

" vim-javascript
let javascript_enable_domhtmlcss=1

" vim-signify
let g:signify_vcs_list = [ 'git', 'hg' ]

" syntastic
let g:syntastic_javascript_checkers = [ 'eslint' ]

" easymotion
map  <Leader><Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)

" deoplete
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" ,<Tab> for regular tab
inoremap <Leader><Tab> <Space><Space>

" tern
if exists('g:plugs["tern_for_vim"]')
  autocmd FileType javascript setlocal omnifunc=tern#Complete
  autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" vim-markdown-preview
let vim_markdown_preview_hotkey='<Leader>md'
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=3

" JSON format
nnoremap <silent> <leader>jf :%!python -m json.tool<CR>
