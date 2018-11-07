
" TODO remove annoying extra space using functions

" --- general settings

set sts=4 st=4

" --- bindings ---

" TODO: move generic c-family stuff to such a file and source it

" iab " ""<esc>i
" iab R" R"~~()~~"<esc>F)i
" iab { {<cr>}<esc>i
" iab if if ()<cr>{<cr>}<esc>2k$i
" iab for for ()<cr>{<cr>}<esc>2k$i
" iab while while ()<cr>{<cr>}<esc>2k$i
" iab do do ()<cr>{<cr>} while()<esc>i
" iab switch switch ()<cr>{<cr>default:<cr>break;<cr>}<esc>4k$i
" iab class class<cr>{<cr>};<esc>2kA
" iab struct struct<cr>{<cr>};<esc>2kA
" iab namespace namespace<cr>{<cr>};<esc>2kA
" iab /* /*<cr>*/<esc>ko

" --- Abbreviations
nnoremap <buffer> <localleader>c I// <esc>
nnoremap <buffer> <localleader>C A  // 

" --- Syntastic Settings ---

let g:syntastic_cpp_checkers = ['clang']
let g:syntastic_cpp_compiler = 'clang'
let g:syntastic_cpp_compiler_options = '-std=c++14'
