if &compatible
  set nocompatible
endif

if exists ('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})
  call minpac#add('kana/vim-operator-user')
  call minpac#add('kana/vim-textobj-user')

  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-sensible')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-eunuch')
  call minpac#add('tpope/vim-sleuth')
  call minpac#add('tpope/vim-abolish')
  call minpac#add('tpope/vim-dispatch')
  call minpac#add('tpope/vim-projectionist')

  call minpac#add('powentan/vim-jsrender')
  call minpac#add('tell-k/vim-autopep8')
  call minpac#add('maksimr/vim-jsbeautify')
  call minpac#add('stephpy/vim-php-cs-fixer')
  call minpac#add('rhysd/vim-clang-format')
  call minpac#add('Chiel92/vim-autoformat')

  call minpac#add('Vimjas/vim-python-pep8-indent')
  call minpac#add('pangloss/vim-javascript')
  call minpac#add('mxw/vim-jsx')
  call minpac#add('jelera/vim-javascript-syntax')
  call minpac#add('Matt-Deacalion/vim-systemd-syntax')
  call minpac#add('2072/vim-syntax-for-PHP')
  call minpac#add('2072/PHP-Indenting-for-VIm')
  call minpac#add('jyelloz/vim-dts-indent')

  call minpac#add('flazz/vim-colorschemes')
  call minpac#add('jceb/vim-orgmode')
  call minpac#add('majutsushi/tagbar')
  call minpac#add('craigemery/vim-autotag')
  call minpac#add('mileszs/ack.vim')
  call minpac#add('vim-syntastic/syntastic')
  call minpac#add('scrooloose/nerdtree')
  call minpac#add('bling/vim-airline')
  call minpac#add('mattn/emmet-vim')

  call minpac#add('kana/vim-textobj-indent')        " ai/ii, aI/iI
  call minpac#add('kana/vim-textobj-entire')        " ae/ie
  call minpac#add('kana/vim-textobj-line')          " al/il
  call minpac#add('bps/vim-textobj-python')         " af/if, ac/ic
  call minpac#add('libclang-vim/vim-textobj-clang') " i;f/a;c

  call minpac#add('MarcWeber/vim-addon-mw-utils')    " snippets
  call minpac#add('tomtom/tlib_vim')                 " snippets
  call minpac#add('garbas/vim-snipmate')             " snippets
  call minpac#add('honza/vim-snippets')              " snippets
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

""" required
filetype plugin indent on

""" use , as <leader> instead of \
let mapleader=","

""" map functionality of, to <c-e>: last c-f, c-t etc in reverse order
nnoremap <c-e> ,

""" configure gui
""" a: autoselect, c: use console instead of popups, g: grey menu items
set guioptions=acg

""" Let's make it easy to edit this file (mnemonic for the key sequence is
""" 'e'dit 'v'imrc)
nmap <silent> <leader>ev :e $MYVIMRC<cr>

""" 's'ource 'v'imrc
nmap <leader>sv :source $MYVIMRC<cr>

""" configure fonts for terminal
let g:main_font = "DejaVu\\ Sans\\ Mono\\ for\\ Powerline\\ Book\\ 10"
let g:small_font = "DejaVu\\ Sans\\ Mono\\ for\\ Powerline\\ Book\\ 2"

""" configureation for gui
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

""" allow buffers to go to background w/out saving etc.
set hidden

""" write as using sudo
command! W w !sudo tee % > /dev/null

""" TAB Completion : 1st longest fit, 2nd list, 3rd cycle
set wildmode=longest,list,full

""" wrap around file end when searching
set wrapscan

""" mark text-to-be-changed by $ sign
set cpoptions+=ces$

""" set the height of the command-line
set cmdheight=2

""" make insertion possible beyond the end of a line
set virtualedit=all

""" max column in wich to search for syntax items, for syntax coloring
set synmaxcol=2048

""" match patterns case insensitive by default "
""" search /\CPattern for case-sensitive
set ignorecase

""" highlight matched search pattern (clear last with <C-L>, sensible.vim)
set hlsearch

""" line numbers
set number

""" don't update the display while executing macros
set lazyredraw

""" show mode below commandline -- note: redundant to airline
set showmode

""" Disable wordwrap
set nowrap

""" visual bell
set visualbell

""" hide mousem when typing until moved again
set mousehide

""" timout for pending operator in ms
set timeoutlen=700

""" When the page starts to scroll, keep the cursor 8 lines from
""" the top and 8 lines from the bottom
set scrolloff=8

""" set matches for insert mode completeion
""" .: current buffer, w: buffers from other windows, b: loaded buffers in
""" bufferlist, u: unloaded buffer in bufferlist, t: tag completion
set complete=.,w,b,u,t

""" expand directories to be searched
""" Search upwards and downwards in a directory tree using "*", "**" and ";".
""" See |file-searching| for info and syntax.
set path+=**

""" sensible vim configurations
runtime! plugin/sensible.vim

""" fold section with from {{{ until }}}
set foldmethod=marker

""" configure how to show whitespace
set listchars=tab:>-,trail:~

""" make trailing spaces and tabls visible
set list

""" highlight ColorColumn ctermbg=235 guibg=#2c2d27
set colorcolumn=80

""" these commands autoopen folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

""" set printing options
set printoptions=paper:A4,syntax:n,wrap:y,duplex:off

""" Save undo's after file closes
set undofile

""" where to save undo histories
set undodir=$HOME/.vim/undo

""" How many undos
set undolevels=1000

""" number of lines to save for undo
set undoreload=10000

""" ignore whitespace only differences
set diffopt+=iwhite

""" configure printing function (outdated)
set printexpr=PrintFile(v:fname_in)
function! PrintFile(fname)
  call system("cat " . a:fname . "| lpr")
  "call system("cat " . a:fname . "| lpr -o number-up=2")
  "call system("cat " . a:fname . "| lpr -Pml1610 -o number-up=1")
  call delete(a:fname)
  return v:shell_error
endfunction

"============================================================================
" Plugin 'rhysd/vim-clang-format'
"================================

""" map to <Leader>cf in C++ code (normal)
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>

""" map to <Leader>cf in C++ code (visual)
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

""" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)

""" Toggle auto formatting: nmap <Leader>C :ClangFormatAutoToggle<CR>
map <C-K> <Plug>(operator-clang-format)

""" configure indentation style
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
                 \ "BeforeElse"            : "true",
                 \ "IndentBraces"          : "false",
      \},
      \ "BreakBeforeTernaryOperators"                    : "false",
      \ "ColumnLimit"                                    : 79,
      \ "ConstructorInitializerAllOnOneLineOrOnePerLine" : "true",
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
      \ "SpacesBeforeTrailingComments"                   : 4,
      \ "SpacesInAngles"                                 : "false",
      \ "SpacesInCStyleCastParentheses"                  : "false",
      \ "SpacesInParentheses"                            : "false",
      \ "SpacesInSquareBrackets"                         : "false",
      \ "Standard"                                       : "Cpp03",
      \ "UseTab"                                         : "Never",
\}

"============================================================================
" Plugin 'tell-k/vim-autopep8'
"========================="===
let g:autopep8_max_line_length=79
let g:autopep8_indent_size=2
let g:autopep8_disable_show_diff=1

"============================================================================
" Plugin 'bling/vim-airline'
"============================
let g:airline_powerline_fonts = 1

"============================================================================
" Plugin 'majutsushi/tagbar'
"===========================
nmap <F8> :Tagbar<cr>

"============================================================================
"Plugin 'scrooloose/nerdtree'
"===========================
nmap <F12> :NERDTreeToggle<cr>

"============================================================================
" Plugin 'tpope/vim-dispatch'
"============================
nnoremap <F9> :Dispatch<CR>
nnoremap <F6> :Make<CR>
"nnoremap <F5> :Make!<CR>
noremap <F5> :exec '!/home/mario/projekte/unity-a2/be4trade/install.sh'<CR>

""" configure make program
" set makeprg=make\ -j8\ -C\ ~/pc/bincore
set makeprg=make\ -j8\ -C\ ~/projekte/unity-a2/bincore

"============================================================================
" Plugin 'mileszs/ack.vim'
"============================
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"=============================================================================
" Plugin 'vim-syntastic/syntastic'
"=================================
"let g:syntastic_php_checkers = ['php']
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_exec = '~/.composer/vendor/bin/phpcs'
let g:syntastic_php_phpcs_args = '--standard=PSR2'
"let g:syntastic_php_phpmd_exec = '~/.composer/vendor/bin/phpmd'
"let g:syntastic_php_phpmd_post_args = 'cleancode,codesize,controversial,design,unusedcode'

"let g:syntastic_html_tidy_ignore_errors = ['<input> proprietary attribute "role"']
let g:syntastic_html_tidy_ignore_errors =  []
"let g:syntastic_html_tidy_blocklevel_tags = []
"let g:syntastic_html_tidy_inline_tags = []
"let g:syntastic_html_tidy_empty_tags = []

"=============================================================================
" Plugin '2072/PHP-Indenting-for-VIm'
"====================================
let g:PHP_vintage_case_default_indent = 1
let g:PHP_removeCRwhenUnix = 1
let g:PHP_autoformatcomment = 0
let php_sql_query = 0
let php_htmlInStrings = 0
let php_baselib = 0

"============================================================================
" Plugin 'stephpy/vim-php-cs-fixer'
"==================================
let g:php_cs_fixer_rules = "@PSR2"
"et g:php_cs_fixer_php_path = =php=
let g:php_cs_fixer_dry_run = 0
let g:php_cs_fixer_verbose = 0

"============================================================================
" Plugin 'tpope/vim-commentary'
"==============================
autocmd FileType php setlocal commentstring=//\ %s
autocmd FileType cmake setlocal commentstring=#\ %s
autocmd FileType cpp setlocal commentstring=//\ %s

"============================================================================
" Plugin 'pangloss/vim-javascript'
"=================================
let g:javascript_plugin_jsdoc = 1

"============================================================================
" Plugin 'junegunn/vim-easy-align'
"=================================
 " Start interactive EasyAlign in visual mode (e.g. vipga)
 "
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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

"finish
