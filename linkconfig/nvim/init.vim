call plug#begin('~/.vim/plugged')

" Always
Plug 'chriskempson/base16-vim'
Plug 'jnurmine/Zenburn'
Plug 'twerth/ir_black'
Plug 'Lokaltog/vim-easymotion'
Plug 'phildawes/racer'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'critiqjo/lldb.nvim'
Plug 'posva/vim-vue'
" On demand
Plug 'fatih/vim-go', { 'for': 'go' }

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
nnoremap <Leader>jf :%!python -m json.tool<CR>

" Colours
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Make active buffer statusline and search a little more readable
" highlight StatusLine ctermfg=18 ctermbg=3
" highlight Search ctermfg=18 ctermbg=3

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
map <Leader>m <C-W><Bar>

" Move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-p> :FZF<CR>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

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

" vim-go
let g:go_fmt_command = "goimports"

" vim-signify
let g:signify_vcs_list = [ 'git', 'hg' ]

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" rust
let g:deoplete#sources#rust#racer_binary = "/home/basie/.cargo/bin/racer"
let g:deoplete#sources#rust#rust_source_path = "/home/basie/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:is_whitespace() "{{{
	let col = col('.') - 1
	return ! col || getline('.')[col - 1] =~? '\s'
endfunction "}}}

" neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_warning_sign = {
  \ 'text': '=>',
  \ 'texthl': 'DiffChange'
  \ }
let g:neomake_error_sign = {
  \ 'text': '=>',
  \ 'texthl': 'DiffAdd'
  \ }
autocmd! BufWritePost * Neomake

" lldb.nvim
nmap <silent> <leader>bp <Plug>LLBreakSwitch<CR>

" go
"let g:go_fmt_command = "gofmt"
"let g:go_fmt_options = "-tabs=false -tabwidth=4"

autocmd! BufEnter *.go setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab

" vim-go setup
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 1 " use neomake instead

" run go test first to catch errors in tests and code, and then gometalinter
let gomakeprg =
  \ 'go test -o /tmp/vim-go-test -c ./%:h && ' .
    \ '! gometalinter ' .
      \ '--disable=gofmt ' .
      \ '--disable=dupl ' .
      \ '--tests ' .
      \ '--fast ' .
      \ '--sort=severity ' .
      \ '--exclude "should have comment" ' .
    \ '| grep "%"'

" match gometalinter + go test output
let goerrorformat =
  \ '%f:%l:%c:%t%*[^:]:\ %m,' .
  \ '%f:%l::%t%*[^:]:\ %m,' .
  \ '%W%f:%l: warning: %m,' .
  \ '%E%f:%l:%c:%m,' .
  \ '%E%f:%l:%m,' .
  \ '%C%\s%\+%m,' .
  \ '%-G#%.%#'

" wire in Neomake
autocmd BufEnter *.go let &makeprg = gomakeprg
autocmd BufEnter *.go let &errorformat = goerrorformat
autocmd! BufWritePost *.go Neomake!
