"
set nocompatible

" --- Vundle ---

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/vundle/Vundle.vim
Plugin 'VundleVim/Vundle.vim'

" ---  Making Vim look good ---

Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'lervag/vimtex'
Plugin 'Syntastic'
Plugin 'The-NERD-tree'
Plugin 'Tagbar'
Plugin 'tpope/vim-fugitive'

call vundle#end()

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set st=4 sts=4

function! ResetTabs(count)
  execute "set tabstop=" . a:count
  execute "set shiftwidth=" . a:count
  execute "set st=" . a:count
  execute "set sts=" . a:count
  set expandtab
endfunction
nnoremap <localleader>I :<C-U>call ResetTabs(v:count)<cr>


" nnoremap <localleader>I :<C-U>set tabstop=v:count shiftwidth=v:count st=v:count sts=v:count


" --- End Vundle ---

" --- General Settings ---

" set visualbell
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on

set mouse=a

" --- Plugin Specific Settings ---

let maplocalleader = "-"

" --- nerdtree Settings ---

let NERDTreeDirArrows=0
nnoremap <localleader>f :NERDTreeToggle<return>

" ---  tagbar Settings ---

nnoremap <localleader>F :TagbarOpen<return>

" --- altercation/vim-colors-solarized settings ---

set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" --- bling/vim-airline settings ---

set laststatus=2

let g:airline_powerline_fonts=1

let g:airline_detect_paste=1

let g:airline#extensions#tabline#enabled=1

let g:airline_theme='solarized'

" --- Syntastic Settings ---

let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': []}
nnoremap <localleader>ss :SyntasticCheck<cr>
nnoremap <localleader>sr :SyntasticReset<cr>

" --- Mike Stuff

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
" inoremap <c-j> <esc>
" inoremap <s-BS> <del>
" rearranging
nnoremap <c-j> ddp
nnoremap <c-k> ddkP
nnoremap <c-l> xp
nnoremap <c-h> xhhp
" big boy jumps
nnoremap J 20j
nnoremap K 20k
" help key
nnoremap <localleader>h K
nnoremap <localleader>a ea
" alternate buffer
nnoremap <localleader>B <c-^>
" alternate buffer location
nnoremap <localleader>b ``
" override readonly
nnoremap <localleader>W :w !sudo tee % > /dev/null<return>
set timeoutlen=1000

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
