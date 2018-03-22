" Author: Mario Forner <m.forner@be4energy.com>
" Last Modified Date: 2018-02-15
" Last Modified By: Mario Forner <m.forner@be4energy.com>

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'        " package manager
Plugin 'kana/vim-operator-user'   " lib for defining operators, clang
Plugin 'kana/vim-textobj-user'    " prereq for text obj

Plugin 'flazz/vim-colorschemes'   " colorschemes
Plugin 'terryma/vim-smooth-scroll'
Plugin 'jceb/vim-orgmode'

Plugin 'tpope/vim-surround'       " modify surrounding parentheses etc
Plugin 'tpope/vim-sensible'       " some sensible defaults
Plugin 'tpope/vim-unimpaired'     " [a, ]b, etc.
Plugin 'tpope/vim-repeat'         " make . work with surround
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-eunuch'         " Unix system 
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-sleuth'         " autoset indentation
Plugin 'tpope/vim-vinegar'        " filemanager with -
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-abolish'        " abbreviations

Plugin 'bling/vim-airline'        " colorfull status bar

Plugin 'junegunn/vim-easy-align'


Plugin 'MarcWeber/vim-addon-mw-utils'    " snippets
Plugin 'tomtom/tlib_vim'                 " snippets
Plugin 'garbas/vim-snipmate'             " snippets
Plugin 'honza/vim-snippets'              " snippets

Plugin 'craigemery/vim-autotag'
Plugin 'vim-syntastic/syntastic'

Plugin 'Matt-Deacalion/vim-systemd-syntax'

Plugin 'tell-k/vim-autopep8'       " autoformat python
Plugin 'maksimr/vim-jsbeautify'    " autoformat js
Plugin 'stephpy/vim-php-cs-fixer'  " autoformat php
Plugin 'rhysd/vim-clang-format'    " autoformat c/c++
Plugin 'Chiel92/vim-autoformat'

Plugin 'Vimjas/vim-python-pep8-indent'  " indentation python
Plugin 'pangloss/vim-javascript'        " indentation js
Plugin 'mxw/vim-jsx'
Plugin '2072/PHP-Indenting-for-VIm'     " indentation php

Plugin 'kien/ctrlp.vim'


Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'      " fileexplorer

Plugin 'mileszs/ack.vim'

" custom text objects: https://github.com/kana/vim-textobj-user/wiki
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-line'
Plugin 'bps/vim-textobj-python'
Plugin 'libclang-vim/vim-textobj-clang'

Plugin 'alpertuna/vim-header'

" All of your Plugins must be added before the following line
call vundle#end()         " required
filetype plugin indent on " required

"use , as leader instead of \
let mapleader=","

"last c-f, c-t etc in reverse order map to <c-e>
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
    set background=dark
    colorscheme apprentice
    if !exists("g:vimrcloaded")
        winpos 0 0
        winsize 130 120
        let g:vimrcloaded = 1
    endif
else
    set background=dark
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

" match patterns case insensitive (search /\CPattern for casesensitive
set ignorecase

" highlight matched search pattern (clear last with <C-L>, sensible.vim)
set hlsearch

" line numbers
set number

" don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
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

set colorcolumn=80

set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
set undofile
" Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000 " How many undos
set undoreload=10000 " number of lines to save for undo


"==============================================================================
" PRINTING:
"===========
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
" Plugin 'rhysd/vim-clang-format'
"================================
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<cr>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<cr>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
"nmap <Leader>C :ClangFormatAutoToggle<cr>
map <C-K> <Plug>(operator-clang-format)

let g:clang_format#style_options = {
      \ "AccessModifierOffset"                           : -2,
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

"==============================================================================
" Plugin 'tell-k/vim-autopep8'
"========================="===
let g:autopep8_max_line_length=79
let g:autopep8_indent_size=2
let g:autopep8_disable_show_diff=1

"==============================================================================
" Plugin 'bling/vim-airline'
"============================
let g:airline_powerline_fonts = 1

"==============================================================================
" Plugin 'majutsushi/tagbar'
"===========================
nmap <F8> : Tagbar<cr>

"==============================================================================
" Plugin 'mileszs/ack.vim'
"============================
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"==============================================================================
" Plugin 'tpope/vim-dispatch'
"============================
nnoremap <F9> :Dispatch<CR>

"==============================================================================
" makeprg
"========
nnoremap <F5> :Make!<CR>
" set makeprg=~/projekte/unity-a2/install.sh
"set makeprg=~/projekte/unity-a2/bincore/install.sh
set makeprg=make\ -C\ ~/projekte/unity-a2/bincore
"==============================================================================
" Plugin 'vim-syntastic/syntastic'
"=================================
"let g:syntastic_php_checkers = ['php']
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_exec = '~/.composer/vendor/bin/phpcs'
let g:syntastic_php_phpcs_args = '--standard=PSR2'
let g:syntastic_php_phpmd_exec = '~/.composer/vendor/bin/phpmd'
let g:syntastic_php_phpmd_post_args = 'cleancode,codesize,controversial,design,unusedcode'

"let g:syntastic_html_tidy_ignore_errors = ['<input> proprietary attribute "role"']
let g:syntastic_html_tidy_ignore_errors =  []
"let g:syntastic_html_tidy_blocklevel_tags = []
"let g:syntastic_html_tidy_inline_tags = []
"let g:syntastic_html_tidy_empty_tags = []


"==============================================================================
" Plugin '2072/PHP-Indenting-for-VIm'
"====================================
let g:PHP_vintage_case_default_indent = 1
let g:PHP_removeCRwhenUnix = 1
let g:PHP_autoformatcomment = 0

"==============================================================================
" Plugin 'stephpy/vim-php-cs-fixer'
"==================================
let g:php_cs_fixer_rules = "@PSR2"
"et g:php_cs_fixer_php_path = =php=
let g:php_cs_fixer_dry_run = 0
let g:php_cs_fixer_verbose = 0

"==============================================================================
" Plugin 'kien/ctrlp.vim'
"========================
" Set no max file limit
let g:ctrlp_max_files = 0
" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 'ra'
" Ignore these directories
set wildignore+=*/out/**
set wildignore+=*/vendor/**
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|ariag25root-20160617)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': '\v\.(ariag25root-2)',
      \ }
" Search in certain directories a large project (hardcoded for now)
cnoremap %proj <c-r>=expand('~/Projects/some-project')<cr>
" ga = go api
map <Leader>ga :CtrlP %proj/api/<cr>
" gf = go frontend
map <Leader>gf :CtrlP %proj/some/long/path/to/frontend/code/<cr>

"=============================================================================
" Plugin 'alpertuna/vim-header'
"==============================
let g:header_field_author = 'Mario Forner'
let g:header_field_author_email = 'm.forner@be4energy.com'
map <F4> :AddHeader<CR>
let g:header_auto_add_header = 0
let g:header_max_size = 20
let g:header_alignment = 0
let g:header_field_filename = 0
let g:header_field_timestamp = 0
let g:header_field_modified_timestamp = 1
let g:header_field_timestamp_format='%Y-%m-%d'

"=============================================================================
" Plugin 'tpope/vim-commentary'
"==============================
autocmd FileType php setlocal commentstring=//\ %s
autocmd FileType cmake setlocal commentstring=#\ %s
autocmd FileType cpp setlocal commentstring=//\ %s

"=============================================================================
"Plugin 'maksimr/vim-jsbeautify'
"===============================
" autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
"
" autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
" autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
" autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
" autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
" autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
"============================================================================
" Plugin 'alpertuna/vim-header'
"==============================
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"============================================================================
" Plugin 'pangloss/vim-javascript'
"=================================
let g:javascript_plugin_jsdoc = 1
"============================================================================
" Plugin 'junegunn/vim-easy-align'
"=================================
 " Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"finish
