let g:ale_emit_conflict_warnings = 0

call plug#begin('$XDG_DATA_HOME/nvim/plugged')

" Always
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'justinmk/vim-sneak'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'w0rp/ale'
Plug 'neomake/neomake'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'matze/vim-move'
Plug 'ludovicchabant/vim-gutentags'
Plug 'raghur/vim-ghost', { 'do': ':GhostInstall' }
Plug 'guns/xterm-color-table.vim'

" In development
" Plug '~/w/neocortex'

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
set clipboard+=unnamedplus

" Formatting
set background=dark
filetype plugin indent on
syntax on
if filereadable('$XDG_CONFIG_HOME/background')
  let base16colorspace=256
  source '$XDG_CONFIG_HOME/background'
endif
let g:airline_powerline_fonts=1
let g:solarized_base16=1
let g:airline_theme='solarized'
set nowrap
set textwidth=0
set wrapmargin=0
set autoindent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set fillchars=vert:\ ,stl:\ ,stlnc:\ , " note: trailling comma required
set statusline=\ %t\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
nnoremap <Leader>jf :%!python -m json.tool<CR>

" Key
inoremap jj <Esc>
inoremap jk <Esc>
let mapleader = ','
nmap <leader>ev :e $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>
map <Leader>p <C-^>
map <Leader>. :bn<CR>
map <Leader>bd :bd<CR>
map <Leader>w :w<CR>
map <Leader>q :q<CR>

" Maximise current
map <leader>m <C-W><Bar>

" Open all folds
map <leader>ff zR

" Splits
map <leader>vs :vs<CR>
map <leader>sp :sp<CR>

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
nnoremap <silent> <leader>du :diffupdate<CR>
nnoremap <silent> <leader>dgt :diffget //2<CR>
nnoremap <silent> <leader>dgm :diffget //3<CR>

" Location list
nnoremap <silent> <leader>ln :lnext<CR>
nnoremap <silent> <leader>lp :lprevious<CR>

" vim-go
let g:go_fmt_command = "goimports"

" vim-signify
highlight clear SignColumn
let g:signify_vcs_list               = [ 'git', 'hg' ]
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = 'Δ'
let g:signify_sign_changedelete      = g:signify_sign_change

" highlight lines in Sy and vimdiff etc.)

highlight DiffAdd cterm=bold ctermbg=none ctermfg=34
highlight DiffDelete cterm=bold ctermbg=none ctermfg=16
highlight DiffChange cterm=bold ctermbg=none ctermfg=4

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

" javascript make/test
highlight NeomakeErrorMsg ctermfg=1 ctermbg=18
highlight NeomakeWarningMsg ctermfg=16 ctermbg=18
let g:neomake_error_sign = {
    \ 'text': '✖',
    \ 'texthl': 'NeomakeErrorMsg'
    \ }
let g:neomake_warning_sign = {
    \ 'text': '⚑',
    \ 'texthl': 'NeomakeWarningMsg'
    \ }
let g:neomake_open_list = 2
let g:neomake_javascript_jest_maker = {
    \ 'exe': './node_modules/jest-cli/bin/jest.js',
    \ 'args': [ '-c=./vim-jest.json', '--no-watchman' ],
    \ 'errorformat':
        \ '%f:%l:%c:%t:%m,' .
        \ '%-G%.%#'
    \ }
let g:neomake_javascript_enabled_makers = ['jest']
call neomake#configure#automake('w')

" linting
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚑'
highlight ALEErrorSign ctermfg=1 ctermbg=18
highlight ALEWarningSign ctermfg=16 ctermbg=18
let g:ale_linters = {
    \ 'javascript': ['standard']
    \ }
let g:ale_fixers = {
    \ 'javascript': ['standard']
    \ }
let g:ale_fix_on_save = 1

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Sneak
let g:sneak#label = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" ripgrep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
nnoremap <leader>rg :Rg 
