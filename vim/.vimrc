set nocompatible
filetype plugin indent on
syntax enable
syntax on

set number
set listchars=tab:»\ ,eol:¬,trail:·
imap <F6> <ESC>:set list!<CR>
nmap <F6> <ESC>:set list!<CR>

set nowrap
set clipboard=unnamed

set textwidth=80
set formatoptions=crq

set encoding=utf8
set autoindent
set hlsearch
set lazyredraw
set incsearch
set wildmenu
set splitbelow
set splitright

"indentation settings
set expandtab
set shiftwidth=4
set tabstop=4
autocmd Filetype markdown setlocal ts=4 sts=4 sw=4
autocmd Filetype .wiki setlocal ts=4 sts=4 sw=4
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal et ts=2 ai sw=2 nu sts=0

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"For editing ecrypted files
setlocal cryptmethod=blowfish2
autocmd VimEnter * if ! empty(&l:key) | set viminfo="" | echomsg "Adapted for encrypted editing" | endif

"Load template if present
augroup templates
    au!
    " read in template files
    autocmd BufNewFile *.* silent! execute '0r ~/.vim/templates/skeleton.'.expand("<afile>:e")

    " parse special text in the templates after the read
    autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
augroup END


" =================
" === Functions ===
" =================

" Wraps/unwraps
noremap <silent> <Leader>- :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction


" ===============
" === Plugins ===
" ===============
call plug#begin('~/.vim/plugged')

Plug 'rickhowe/diffchar.vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-peekaboo'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'mechatroner/rainbow_csv'
Plug 'dense-analysis/ale'
Plug 'dylanaraps/wal.vim'

call plug#end()

colorscheme wal
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='distinguished'

let g:ale_linters = {'sh': ['shellcheck'],}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
