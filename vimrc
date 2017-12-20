set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'        " package manager
Plugin 'flazz/vim-colorschemes'   " colorschemes
Plugin 'tpope/vim-surround'       " modify surrounding parentheses etc
Plugin 'tpope/vim-sensible'       " some sensible defaults
Plugin 'tpope/vim-repeat'         " make . work with surround
Plugin 'scrooloose/nerdcommenter' " <leader>cc
Plugin 'kien/ctrlp.vim'           " fuzzy search
Plugin 'scrooloose/nerdtree'      " fileexplorer
Plugin 'bling/vim-airline'        " colorfull status bar
Plugin 'godlygeek/tabular'        " align, :Tabularize /pattern

Plugin 'kana/vim-operator-user'   " lib for defining operators, clang
Plugin 'tpope/vim-dispatch'

Plugin 'vim-scripts/a.vim'        " alternate files, <leader>ih

" :python3 makes python2 plugins unusable
"Plugin 'SirVer/ultisnips'         " snippets TAB

Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'rhysd/vim-clang-format'
Plugin 'jceb/vim-orgmode'



Plugin 'majutsushi/tagbar'

"Plugin 'tpope/vim-abolish'        " abbreviations
"Plugin 'tpope/vim-fugitive'       " git commands
Plugin 'tpope/vim-unimpaired'     " [a, ]b, etc.

Plugin 'craigemery/vim-autotag'
Plugin 'tell-k/vim-autopep8'

" All of your Plugins must be added before the following line
call vundle#end()         " required
filetype plugin indent on " required

"use , as leader instead of \
let mapleader=","

"last c-f, c-t etc in reverse order map to <c-e>
nnoremap <c-e> ,

"     \ "AlwaysBreakAfterReturnType": "All",

let g:clang_format#style_options = {
      \ "Language" : "C",
      \ "AccessModifierOffset" : -2,
      \ "AlignAfterOpenBracket" : "Align",
      \ "AlignConsecutiveAssignments" : "true",
      \ "AlignConsecutiveDeclarations" : "true",
      \ "AlignEscapedNewlinesLeft" : "true",
      \ "AlignOperands" :   "true",
      \ "AlignTrailingComments" : "true",
      \ "AllowAllParametersOfDeclarationOnNextLine" : "false",
      \ "AllowShortBlocksOnASingleLine" : "false",
      \ "AllowShortCaseLabelsOnASingleLine" : "false",
      \ "AllowShortFunctionsOnASingleLine" : "Empty",
      \ "AllowShortIfStatementsOnASingleLine" : "false",
      \ "AllowShortLoopsOnASingleLine" : "false",
      \ "AlwaysBreakAfterReturnType" : "All",
      \ "AlwaysBreakBeforeMultilineStrings" : "false",
      \ "AlwaysBreakTemplateDeclarations" : "true",
      \ "BinPackArguments" : "true",
      \ "BinPackParameters" : "true",
      \ "BraceWrapping" :   {
      \ "AfterClass" :      "false",
      \ "AfterControlStatement" : "false",
      \ "AfterEnum" :       "false",
      \ "AfterFunction" :   "true",
      \ "AfterNamespace" :  "false",
      \ "AfterObjCDeclaration" : "false",
      \ "AfterStruct" :     "false",
      \ "AfterUnion" :      "false",
      \ "BeforeCatch" :     "true",
      \ "BeforeElse" :      "false",
      \ "IndentBraces" :    "false",
      \  },
      \ "BreakBeforeBinaryOperators" : "NonAssignment",
      \ "BreakBeforeBraces" : "Custom",
      \ "BreakBeforeTernaryOperators" : "false",
      \ "ColumnLimit" :     80,
      \ "BreakConstructorInitializersBeforeComma" : "true",
      \ "ConstructorInitializerAllOnOneLineOrOnePerLine" : "true",
      \ "ConstructorInitializerIndentWidth" : 2,
      \ "ContinuationIndentWidth" : 2,
      \ "Cpp11BracedListStyle" : "false",
      \ "DerivePointerAlignment" : "false",
      \ "DisableFormat" :   "false",
      \ "ExperimentalAutoDetectBinPacking" : "false",
      \ "IndentCaseLabels" : "false",
      \ "IndentWidth" :     2,
      \ "IndentWrappedFunctionNames" : "false",
      \ "KeepEmptyLinesAtTheStartOfBlocks" : "true",
      \ "MaxEmptyLinesToKeep" : 1,
      \ "NamespaceIndentation" : "None",
      \ "ObjCBlockIndentWidth" : 2,
      \ "ObjCSpaceAfterProperty" : "false",
      \ "ObjCSpaceBeforeProtocolList" : "true",
      \ "PenaltyBreakBeforeFirstCallParameter" : 1000000,
      \ "PenaltyBreakComment" : 300,
      \ "PenaltyBreakFirstLessLess" : 120,
      \ "PenaltyBreakString" : 1000,
      \ "PenaltyExcessCharacter" : 1000000,
      \ "PenaltyReturnTypeOnItsOwnLine" : 60,
      \ "PointerAlignment" : "Left",
      \ "ReflowComments" :  "false",
      \ "SortIncludes" :    "true",
      \ "SpaceAfterCStyleCast" : "false",
      \ "SpaceBeforeAssignmentOperators" : "true",
      \ "SpaceBeforeParens" : "ControlStatements",
      \ "SpacesBeforeTrailingComments" : 1,
      \ "SpacesInAngles" :  "false",
      \ "SpacesInContainerLiterals" : "true",
      \ "SpacesInCStyleCastParentheses" : "false",
      \ "SpacesInParentheses" : "false",
      \ "SpaceInEmptyParentheses" : "false",
      \ "SpacesInSquareBrackets" : "false",
      \ "Standard" :        "Cpp03",
      \ "TabWidth" :        2,
      \ "UseTab" :          "Never",
      \ }
"\ }


"\ "MacroBlockBegin" : '',
"\ "MacroBlockEnd" :   '',
"\ "ForEachMacros":   [ 'foreach', 'Q_FOREACH', 'BOOST_FOREACH' ],
"\ "CommentPragmas" :  '^ IWYU pragma:',
""IncludeCategories": 
"- Regex:           '^<.*\.h>'
"Priority:        1
"- Regex:           '^<.*'
"Priority:        2
"- Regex:           '.*'
"Priority:        3


" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)


" gui
set guioptions=acg

nmap <silent> <leader>of :A<cr>

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> <leader>ev :e $MYVIMRC<cr>
" 's'ource 'v'imrc
nmap <leader>sv :source $MYVIMRC<cr>

" Tabstops are 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
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
let &colorcolumn=join(range(91),",")
let &colorcolumn="90,".join(range(120,999),",")

set sw=4
set tw=90

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

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

let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_custom_ignore = 'CMakeFiles, ariag25root'

" Ignore some folders and files for CtrlP indexing

nnoremap <leader>. :CtrlPTag<cr>

" AIRLINE PLUGIN:
let g:airline_powerline_fonts = 1

" NERDTREE PLUGIN:

nmap <F12> :NERDTreeToggle<CR>
nmap <F8> :Tagbar<CR>

function! SimcomUnittest()
    :!cd ~/projekte/simcom && python -m unittest discover; cd - > /dev/null
endfunction

nnoremap <F5> :call SimcomUnittest()<CR>
nnoremap <F6> :Make<CR>
nnoremap <F7> :!rsync -rzog --chown=www-data:www-data --safe-links --exclude='*swp' ~/projekte/cwd/unity-a2/www root@master975:/var<CR>

"nnoremap <F7> :Make!<CR>

"set makeprg=cd\ ~/projekte/unity-a2/bincore;\ make\ -j8;\ cd\ -
set makeprg=rsync\ -rz\ --exclude=\'*.swp\'\ --exclude=\'test_*\'\ --exclude=\'*.pyc\'\ ~/projekte/simcom/\ root@master975:~/sbin/
"set makeprg=rsync\ -rz\ --exclude=\'*.swp\'\ --exclude=\'test_*\'\ --exclude=\'*.pyc\'\ ~/projekte/simcom/\ root@master1009.:~/sbin/

iabbrev udn und

set undofile
" Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000 " How many undos
set undoreload=10000 " number of lines to save for undo

" run line through shell
"noremap Q !!$SHELL<CR>
"
" Hit <alt-v> in : mode, copy last line into command buffer
"cnoremap <M-v> <C-\>esubstitute(getline('.'), '^\s*\(' . escape(substitute(&commentstring, '%s.*$', '', ''), '*') . '\)*\s*:*' , '', '')

"finish
