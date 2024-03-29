"

set nocompatible

" --- Vundle ---

filetype off

set encoding=utf-8

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/vundle/Vundle.vim
Plugin 'VundleVim/Vundle.vim'

" ---  Plugins ---

Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'lervag/vimtex'
Plugin 'Syntastic'
Plugin 'The-NERD-tree'
Plugin 'Tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'chaoren/vim-wordmotion'
Plugin 'eregex.vim'
Plugin 'mu-template'
Plugin 'surround.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ElmCast/elm-vim'
Plugin 'leafgarland/typescript-vim'

call vundle#end()

filetype plugin indent on
" set tabstop=4
" set shiftwidth=4
" set expandtab
" set st=4 sts=4

function! ResetTabs(count)
    filetype plugin indent on
    execute "set softtabstop=0"
    execute "set expandtab"
    execute "set smarttab"
    execute "set shiftwidth=" . a:count
    execute "set st=" . a:count
    execute "set sts=" . a:count
    execute "set tabstop=" . a:count
    execute "normal gg=G"
    execute "retab"
    execute "normal ``"
endfunction
nnoremap <localleader>I :<C-U>call ResetTabs(v:count)<cr>

set softtabstop=0
set expandtab
set smarttab
" set shiftwidth=4
set st=4
set sts=4
set tabstop=4

" set tabstop=4
" set shiftwidth=4
" set expandtab
" set st=4 sts=4
" literal set tabs

" nnoremap <localleader>I :<C-U>set tabstop=v:count shiftwidth=v:count st=v:count sts=v:count


" --- End Vundle ---

" --- General Settings ---

" set visualbell
set backspace=indent,eol,start
set ruler
set nonumber
set showcmd
set incsearch
set hlsearch

syntax on

set mouse-=a

" diffs writeable by default
if &diff
    set noreadonly
endif

" --- Plugin Specific Settings ---

let maplocalleader = "-"

" --- Vundle.vim ---

nnoremap <localleader>ps :PluginSearch<space>
nnoremap <localleader>pu :PluginUpdate<cr>

" --- eregex.vim ---

let g:eregex_default_enable = 1

" --- nerdtree Settings ---

let NERDTreeDirArrows=0
nnoremap <localleader>f :NERDTreeToggle<cr>

" ---  tagbar Settings ---

nnoremap <localleader>F :TagbarOpen<cr>

" --- altercation/vim-colors-solarized settings ---

set background=dark
let g:solarized_termcolors=256
colorscheme solarized
set t_Co=256
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" --- bling/vim-airline settings ---

set laststatus=2

let g:airline_powerline_fonts=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='solarized'

" --- Syntastic Settings ---

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
" TODO: move to language specifically sources files
let g:syntastic_python_checkers = ['python', 'pylint', 'pep8']
let g:syntastic_cpp_checkers = ['c++']
let g:syntastic_cpp_compiler = 'c++'
let g:syntastic_cpp_compiler_options = '--std=c++17'
nnoremap <localleader>ss :SyntasticCheck<cr>
nnoremap <localleader>sr :SyntasticReset<cr>

" --- TmuxNavigatorSettings ---

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-w>h :TmuxNavigateLeft<cr>
inoremap <silent> <c-w>h <esc>:TmuxNavigateLeft<cr>
nnoremap <silent> <c-w>j :TmuxNavigateDown<cr>
inoremap <silent> <c-w>j <esc>:TmuxNavigateDown<cr>
nnoremap <silent> <c-w>k :TmuxNavigateUp<cr>
inoremap <silent> <c-w>k <esc>:TmuxNavigateUp<cr>
nnoremap <silent> <c-w>l :TmuxNavigateRight<cr>
inoremap <silent> <c-w>l <esc>:TmuxNavigateRight<cr>
nnoremap <silent> <c-w>\ :TmuxNavigatePrevious<cr>
inoremap <silent> <c-w>\ <esc>:TmuxNavigatePrevious<cr>

" --- Mike Stuff ---

set noesckeys
" edit the this thing from anywhr
nnoremap <localleader>re :vsplit $MYVIMRC<cr>
nnoremap <localleader>rs :source $MYVIMRC<cr>
abbrev @@ michael.belousov98@gmail.com
abbrev (203) (203) 502-9425
" elite mode babi
noremap <left> <nop>
noremap <right> <nop>
noremap <down> <nop>
noremap <up> <nop>
" inoremap <s-BS> <del>
" rearranging
nnoremap <c-j> ddp
nnoremap <c-k> ddkP
nnoremap <c-l> xp
nnoremap <c-h> xhhp
" big boy jumps
nnoremap J <c-d>
nnoremap K <c-u>
" open terminal
nnoremap <localleader>t :terminal ++curwin<cr>
" clear search
nnoremap <localleader>/ :nohl<cr>

" TODO: make applicable without macros
" visual mode perline macro 
vnoremap <localleader>@ :'<,'>normal @

vnoremap <localleader>c :'<,'>normal <localleader>c<cr>

" terminal commands
nnoremap <localleader>t :terminal<cr>
tnoremap <esc> <C-W>N

" help key
nnoremap <localleader>h K
vnoremap <localleader>h K
nnoremap <localleader>a ea
" alternate buffer
nnoremap <localleader>B <c-^>
" alternate buffer location
nnoremap <localleader>b ``
" override readonly
nnoremap <localleader>W :w !sudo tee % > /dev/null<cr>

" add new operator pending mapping for pasting into
" separators/delinators (e.g. replace quote contents)
" nnoremap <localleader>p 

" timeout length 
set timeoutlen=1000
set ttimeoutlen=1000

" add space around char
" should be  replaced with 's'
nnoremap <localleader><space> i <esc>la <esc>
nnoremap <localleader><cr> O<esc>jo<esc>k

" this needs some more fun
augroup pythonfiles
    autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>c I# <esc>
    autocmd FileType python nnoremap <buffer> <localleader>C A  # 
    " autocmd FileType python abbrev <buffer> for for :<left>
    " autocmd FileType python abbrev <buffer> if if :<left>
augroup END

augroup javaIGuess
    autocmd!
    autocmd FileType java set sts=2 st=2
augroup END

augroup mike_cpp
    autocmd!
    autocmd FileType cpp source $HOME/.vim/filetypes/cpp.vim
augroup END

augroup filespecifics
    autocmd!
    autocmd FileType c nnoremap <buffer> <localleader>c I// <esc>
    autocmd FileType c nnoremap <buffer> <localleader>C A  // 
    autocmd FileType cpp nnoremap <buffer> <localleader>c I// <esc>
    autocmd FileType cpp nnoremap <buffer> <localleader>C A  // 
    autocmd FileType javascript nnoremap <buffer> <localleader>c I// <esc>
    autocmd FileType javascript nnoremap <buffer> <localleader>C A  // 
    " need to know literal \" before enabling these
    " autocmd FileType vim nnoremap <buffer> <localleader>c I" <esc>
    " autocmd FileType vim nnoremap <buffer> <localleader>C A  " <esc>
augroup END

" need to fix this, to kill terminal on exit
augroup terminal
    autocmd!
    " autocmd TermClose * if getline('$') == 'exit' | close | endif
augroup END

augroup pytex
    autocmd!
    au BufRead,BufNewFile *.pytex set filetype=tex
augroup END

