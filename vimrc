" ===Pluglins===============================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'flazz/vim-colorschemes'


Plugin 'vim-scripts/a.vim'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'

Plugin 'rhysd/vim-clang-format'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'godlygeek/tabular'
" All of your Plugins must be added before the following line

call vundle#end() " required
filetype plugin indent on " required
" ==========================================================

let mapleader=","
nnoremap <c-e> ,
vnoremap <c-e> ,

set exrc
set secure

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
set foldmethod=marker

filetype on
filetype plugin on
filetype indent on
syntax on

" Tabstops are 4 spaces
set tabstop=4

set shiftwidth=4

set softtabstop=4

set expandtab

set autoindent

" allow buffers to go to background w/out saving etc.
set hidden

" mappings

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> <leader>ev :e $MYVIMRC<cr>
" source buffer
nmap <leader>sv :so $MYVIMRC<cr>

" commands
" write as using sudo
command! W w !sudo tee % > /dev/null

" customization
let g:main_font = "DejaVu\\ Sans\\ Mono\\ for\\ Powerline\\ Book\\ 11"
let g:small_font = "DejaVu\\ Sans\\ Mono\\ for\\ Powerline\\ Book\\ 2"
"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
if has("gui_running")
  exe "set guifont=" . g:main_font
  set background=dark
  colorscheme twilight
  if !exists("g:vimrcloaded")
      winpos 0 0
      if !&diff
          winsize 130 120
      else
          winsize 227 120
      endif
      let g:vimrcloaded = 1
  endif
endif

" TAB Completion : 1st longest fit, 2nd list, 3rd cycle
set wildmode=longest,list,full

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu

" wrap around file end when searching
set wrapscan

" mark text-to-be-changed by $ sign
set cpoptions+=ces$

" set the height of the command-line
set ch=2

" make insertion possible beyond the end of a line
set virtualedit=all

" incremental search
set incsearch

" max column in wich to search for syntax items, for syntax coloring
set synmaxcol=2048

" ignorecase
set ignorecase

" highlight matches
set hlsearch

" line numbers
set number

" don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Disable wordwrap
set nowrap

" set size of command-line history
set history=100

" Allow backspacing over autoindent, linebreaks, start of insertion
set backspace=2

" use / instead of \ (only needed under Windows)
set shellslash

" visual bell, for more epilepsy warning :)
set vb

" hide mousem when typing until moved again
set mousehide

" timout for pending operator in ms
set timeoutlen=700

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

set complete=.,w,b,u,t,i

" gui
set guioptions=acgm

" setup printing
" ==============
" some printing options
set printoptions=paper:A4,syntax:n,wrap:y,duplex:off
" set the print-command
set printexpr=PrintFile(v:fname_in)
function! PrintFile(fname)
  call system("cat " . a:fname . "|lpr")
  "call system("cat " . a:fname . "|lpr -o number-up=2")
  "call system("cat " . a:fname . "|lpr -Pml1610 -o number-up=1")
  call delete(a:fname)
  return v:shell_error
endfunction

" clang-format
" ============
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakConstructorInitializersBeforeComma" : "true",
            \ "BreakBeforeBraces" : "Stroustrup"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
map <C-K> <Plug>(operator-clang-format)

" other file - FSwitch
" Switch to the file and load it into the current window
nmap <silent> <Leader>of :FSHere<cr>

let g:airline_powerline_fonts = 1
nmap <F8> :TagbarToggle<CR>

nmap <F12> :NERDTreeToggle<CR>
nnoremap <F5> :make<CR>

set makeprg=compileThesis

iabbrev udn und

let g:paredit_mode=0
let g:paredit_electric_return=0
let g:lisp_rainbow=1

finish
