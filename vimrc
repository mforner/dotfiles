set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'        " package manager

Plugin 'tpope/vim-surround'       " modify surrounding parentheses etc
Plugin 'tpope/vim-sensible'       " some sensible defaults
Plugin 'tpope/vim-unimpaired'     " [a, ]b, etc.
Plugin 'tpope/vim-repeat'         " make . work with surround
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'

Plugin 'scrooloose/nerdtree'      " fileexplorer
Plugin 'flazz/vim-colorschemes'   " colorschemes
Plugin 'bling/vim-airline'        " colorfull status bar
Plugin 'godlygeek/tabular'        " align, :Tabularize /pattern
Plugin 'kana/vim-operator-user'   " lib for defining operators, clang
Plugin 'rhysd/vim-clang-format'   " format c/c++

Plugin 'tpope/vim-abolish'        " abbreviations
Plugin 'vim-scripts/a.vim'        " alternate files, <leader>ih

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'jceb/vim-orgmode'
Plugin 'Matt-Deacalion/vim-systemd-syntax'

Plugin 'pangloss/vim-javascript'
Plugin 'craigemery/vim-autotag'
Plugin 'tell-k/vim-autopep8'

Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'majutsushi/tagbar'
Plugin 'vim-syntastic/syntastic'
  
Plugin '2072/PHP-Indenting-for-VIm'

" All of your Plugins must be added before the following line
call vundle#end()         " required
filetype plugin indent on " required

"use , as leader instead of \
let mapleader=","

"last c-f, c-t etc in reverse order map to <c-e>
nnoremap <c-e> ,

" gui
set guioptions=acg

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> <leader>ev :e $MYVIMRC<cr>
" 's'ource 'v'imrc
nmap <leader>sv :source $MYVIMRC<cr>

" Tabstops are 2 spaces

autocmd FileType c,cpp,objc,js,php set tabstop=2
autocmd FileType c,cpp,objc,js,php set shiftwidth=2
autocmd FileType c,cpp,objc,js,php set softtabstop=2
autocmd FileType c,cpp,objc,js,php set textwidth=80

autocmd FileType py set tabstop=4
autocmd FileType py set shiftwidth=4
autocmd FileType py set softtabstop=4
autocmd FileType py set textwidth=80

set expandtab

let g:main_font = "DejaVu\\ Sans\\ Mono\\ for\\ Powerline\\ Book\\ 10"
let g:small_font = "DejaVu\\ Sans\\ Mono\\ for\\ Powerline\\ Book\\ 2"
if has("gui_running")
    exe "set guifont=" . g:main_font
    set background=dark
    colorscheme twilight
    if !exists("g:vimrcloaded")
        winpos 0 0
        winsize 130 120
        let g:vimrcloaded = 1
    endif
endif

" allow buffers to go to background w/out saving etc.
set hidden

" write as using sudo
command! W w !sudo tee % > /dev/null

" TAB Completion : 1st longest fit, 2nd list, 3rd cycle
set wildmode=longest,list,full

" wrap around file end when searching
set wrapscan

" mark text-to-be-changed by $ sign
set cpoptions+=ces$

" set the height of the command-line
set ch=2

" make insertion possible beyond the end of a line
set virtualedit=all

" max column in wich to search for syntax items, for syntax coloring
set synmaxcol=2048

" match patterns case insensitive by default (search /\CPattern for case-
" sensitive
set ignorecase

" highlight matched search pattern (clear last with <C-L>, sensible.vim)
set hlsearch

"" line numbers
set number

"" don't update the display while executing macros
set lazyredraw

"" At least let yourself know what mode you're in
set showmode

" Disable wordwrap
set nowrap

" visual bell, for more epilepsy warning :)
set vb

"" hide mousem when typing until moved again
set mousehide

" timout for pending operator in ms
set timeoutlen=700

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

set complete=.,w,b,u,t

set path+=**
runtime! plugin/sensible.vim

set foldmethod=marker
set listchars=tab:>-,trail:~
set list

highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(81),",")
let &colorcolumn="80,".join(range(120,999),",")
" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
set undofile
" Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000 " How many undos
set undoreload=10000 " number of lines to save for undo

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PRINTING:
" some printing options
set printoptions=paper:A4,syntax:n,wrap:y,duplex:off
" set the print-command
set printexpr=PrintFile(v:fname_in)
function! PrintFile(fname)
  call system("cat " . a:fname . "| lpr")
  "call system("cat " . a:fname . "| lpr -o number-up=2")
  "call system("cat " . a:fname . "| lpr -Pml1610 -o number-up=1")
  call delete(a:fname)
  return v:shell_error
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CLANG FORMAT PLUGIN:
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
"nmap <Leader>C :ClangFormatAutoToggle<CR>
map <C-K> <Plug>(operator-clang-format)

let g:clang_format#style_options = {
     \ "AccessModifierOffset"                            : -2,
      \ "AlignAfterOpenBracket"                          : "Align",
      \ "AlignConsecutiveAssignments"                    : "true",
      \ "AlignConsecutiveDeclarations"                   : "true",
      \ "AlignOperands"                                  : "true",
      \ "AlignTrailingComments"                          : "true",
      \ "AllowAllParametersOfDeclarationOnNextLine"      : "true",
      \ "AllowShortBlocksOnASingleLine"                  : "false",
      \ "AllowShortCaseLabelsOnASingleLine"              : "false",
      \ "AllowShortFunctionsOnASingleLine"               : "Empty",
      \ "AllowShortIfStatementsOnASingleLine"            : "false",
      \ "AllowShortLoopsOnASingleLine"                   : "false",
      \ "AlwaysBreakAfterReturnType"                     : "All",
      \ "AlwaysBreakBeforeMultilineStrings"              : "false",
      \ "AlwaysBreakTemplateDeclarations"                : "true",
      \ "BinPackArguments"                               : "true",
      \ "BinPackParameters"                              : "true",
      \ "BreakBeforeBinaryOperators"                     : "NonAssignment",
      \ "BreakBeforeBraces"                              : "Custom",
      \ "BraceWrapping"                                  : {
                 \ "AfterClass"            : "false" ,
                 \ "AfterControlStatement" : "false",
                 \ "AfterEnum"             : "true",
                 \ "AfterFunction"         : "true",
                 \ "AfterNamespace"        : "false",
                 \ "AfterStruct"           : "false",
                 \ "AfterUnion"            : "false",
                 \ "BeforeCatch"           : "true",
                 \ "BeforeElse"            : "false",
                 \ "IndentBraces"          : "false",
      \},
      \ "BreakBeforeTernaryOperators"                    : "false",
      \ "ColumnLimit"                                    : 80,
      \ "ConstructorInitializerAllOnOneLineOrOnePerLine" : "false",
      \ "ConstructorInitializerIndentWidth"              : 2,
      \ "ContinuationIndentWidth"                        : 2,
      \ "Cpp11BracedListStyle"                           : "false",
      \ "DerivePointerAlignment"                         : "false",
      \ "DisableFormat"                                  : "false",
      \ "ExperimentalAutoDetectBinPacking"               : "false",
      \ "IndentCaseLabels"                               : "false",
      \ "IndentWidth"                                    : 2,
      \ "IndentWrappedFunctionNames"                     : "false",
      \ "KeepEmptyLinesAtTheStartOfBlocks"               : "true",
      \ "Language"                                       : "Cpp",
      \ "MaxEmptyLinesToKeep"                            : 2,
      \ "NamespaceIndentation"                           : "None",
      \ "PointerAlignment"                               : "Left",
      \ "ReflowComments"                                 : "false",
      \ "SortIncludes"                                   : "false",
      \ "SpaceAfterCStyleCast"                           : "true",
      \ "SpaceBeforeAssignmentOperators"                 : "true",
      \ "SpaceBeforeParens"                              : "ControlStatements",
      \ "SpaceInEmptyParentheses"                        : "false",
      \ "SpacesBeforeTrailingComments"                   : 3,
      \ "SpacesInAngles"                                 : "false",
      \ "SpacesInCStyleCastParentheses"                  : "false",
      \ "SpacesInParentheses"                            : "false",
      \ "SpacesInSquareBrackets"                         : "false",
      \ "Standard"                                       : "Cpp03",
      \ "UseTab"                                         : "Never",
\}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AIRLINE PLUGIN:
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTREE PLUGIN:
nmap <F12> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAGBAR PLUGIN:
nmap <F8> : Tagbar<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAKE command
nnoremap <F5> :Make!<CR>
set makeprg=cd\ ~/projekte/cwd/unity-a2/simcom;\ ./install.sh;\ cd\ -


"finish
