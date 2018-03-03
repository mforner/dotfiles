set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'        " package manager
Plugin 'kana/vim-operator-user'   " lib for defining operators, clang
Plugin 'kana/vim-textobj-user'

Plugin 'flazz/vim-colorschemes'   " colorschemes
Plugin 'bling/vim-airline'        " colorfull status bar
Plugin 'terryma/vim-smooth-scroll'

Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

Plugin 'jceb/vim-orgmode'
Plugin 'kien/ctrlp.vim'
Plugin 'craigemery/vim-autotag'
Plugin 'mileszs/ack.vim'


Plugin 'maksimr/vim-jsbeautify'
Plugin 'tpope/vim-surround'       " modify surrounding parentheses etc
Plugin 'tpope/vim-sensible'       " some sensible defaults
Plugin 'tpope/vim-unimpaired'     " [a, ]b, etc.
Plugin 'tpope/vim-repeat'         " make . work with surround
Plugin 'tpope/vim-commentary'     " gc comment out
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-eunuch'         " :Move, :Rename, :Chmod, :SudoWrite
Plugin 'tpope/vim-sleuth'         " heuristically set sw and et
Plugin 'tpope/vim-vinegar'        " netrw usability changes
Plugin 'tpope/vim-endwise'        " insert end automatically where needed
Plugin 'tpope/vim-abolish'        " typos, coercion

Plugin 'vim-syntastic/syntastic'
Plugin 'gcorne/vim-sass-lint'

Plugin 'junegunn/vim-easy-align'

Plugin 'MarcWeber/vim-addon-mw-utils' " snippets
Plugin 'tomtom/tlib_vim'              " snippets
Plugin 'garbas/vim-snipmate'          " snippets
Plugin 'honza/vim-snippets'           " snippets

Plugin 'Matt-Deacalion/vim-systemd-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'tell-k/vim-autopep8'

Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'Chiel92/vim-autoformat'
Plugin 'rhysd/vim-clang-format'   " format c/c++
Plugin 'stephpy/vim-php-cs-fixer'

Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-entire'
Plugin 'bps/vim-textobj-python'




" All of your Plugins must be added before the following line
call vundle#end()         " required
filetype plugin indent on " required

"use , as leader instead of \
let mapleader=","
nnoremap <c-e> , 

" gui
set guioptions=acg
set ff=unix

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> <leader>ev :e $MYVIMRC<cr>
" 's'ource 'v'imrc
nmap <leader>sv :source $MYVIMRC<cr>

let g:main_font = "DejaVu\\ Sans\\ Mono\\ for\\ Powerline\\ Book\\ 10"
let g:small_font = "DejaVu\\ Sans\\ Mono\\ for\\ Powerline\\ Book\\ 2"
if has("gui_running")
    exe "set guifont=" . g:main_font
    colorscheme apprentice
    if !exists("g:vimrcloaded")
        winpos 0 0
        winsize 130 120
        let g:vimrcloaded = 1
    endif
else
    colorscheme apprentice
endif

" allow buffers to go to background w/out saving etc.
set hidden

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

"when selecting a file over netrw, don't make netrw the prev buffer
let g:netrw_altfile = 1

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

set colorcolumn=80
" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
set undofile
" Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000 " How many undos
set undoreload=10000 " number of lines to save for undo

nnoremap <F5> :Make!<CR>
set makeprg=cd\ ~/projekte/cwd/unity-a2/simcom;\ ./install.sh;\ cd\ -

"=============================================================================
" Printing:
"==========
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
"==============================================================================
" Plugin: 'rhysd/vim-clang-format'
"================================
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<cr>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<cr>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
"nmap <Leader>C :ClangFormatAutoToggle<cr>
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
      \ "ColumnLimit"                                    : 79,
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
"=============================================================================
" Plugin: 'tell-k/vim-autopep8'
"=============================
let g:autopep8_max_line_length=79
let g:autopep8_indent_size=2
let g:autopep8_disable_show_diff=1
"=============================================================================
" Plugin: 'mileszs/ack.vim'
"=========================
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"=============================================================================
" Plugin: 'bling/vim-airline'
"===========================
let g:airline_powerline_fonts = 1
"=============================================================================
" Plugin: 'scrooloose/nerdtree'
"=============================
nmap <F12> :NERDTreeToggle<cr>
"=============================================================================
" Plugin: 'majutsushi/tagbar'
"===========================
nmap <F8> : Tagbar<cr>
"=============================================================================
" Plugin: 'vim-syntastic/syntastic'
"=================================
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = '--standard=psr2'
let g:syntastic_php_phpcs_exec = '~/vendor/bin/phpcs'
let g:syntastic_php_phpmd_exec = '~/vendor/bin/phpmd'
let g:syntastic_php_phpmd_post_args = 'cleancode,codesize,controversial,design,unusedcode'

let g:syntastic_sass_checkers=["sasslint"]
let g:syntastic_scss_checkers=["sasslint"]
"==============================================================================
" Plugin: 'kien/ctrlp.vim'
"========================
 " Set no max file limit
let g:ctrlp_max_files = 0
" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0

" Ignore these directories
set wildignore+=*/out/**
set wildignore+=*/vendor/**
"==============================================================================
" Plugin: 'stephpy/vim-php-cs-fixer'
"==================================
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_php_path = "php"               " Path to PHP

let g:PHP_vintage_case_default_indent = 1
"=============================================================================
" Plugin: 'tpope/vim-commentary'
"==============================
 autocmd FileType php setlocal commentstring=#\ %s
"=============================================================================
" Plugin 'maksimr/vim-jsbeautify'
"================================


"=============================================================================
"Plugin 'https://github.com/terryma/vim-smooth-scroll'
"=====================================================
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
