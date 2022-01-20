if &compatible
  set nocompatible
endif

if !exists ('g:loaded_minpac')
else
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " sensible default settings
  call minpac#add('tpope/vim-sensible')

  " surrond text objects with quotes or parentheses
  call minpac#add('tpope/vim-surround')

  " allow plugin mappings to be repeated with .
  call minpac#add('tpope/vim-repeat')

  " vim unimpaired: ]b, ]a, ]q, ]x, ]u, ]f, ]n, ]e, ]<space>
  call minpac#add('tpope/vim-unimpaired')

  " add or remove comment on selected text
  call minpac#add('tpope/vim-commentary')

  " delete, move, rename etc of current file
  call minpac#add('tpope/vim-eunuch')

  " define abbreviations and substitute for multiple case variants
  call minpac#add('tpope/vim-abolish')

  " vim dispatch
  call minpac#add('tpope/vim-dispatch')

  " project specific settings via json file
  call minpac#add('tpope/vim-projectionist')

  " use netrw as file browser
  call minpac#add('tpope/vim-vinegar')

  " configure indentation settings heuristically
  call minpac#add('tpope/vim-sleuth')

  " Jinja bundle for vim.
  call minpac#add('lepture/vim-jinja')

  " vim-autopep8 is a Vim plugin that applies autopep8 to your current file.
  call minpac#add('tell-k/vim-autopep8')

  " This plugin formats your code with specific coding style using clang-format.
  call minpac#add('rhysd/vim-clang-format')

  " python pep8 like indentation rules
  call minpac#add('Vimjas/vim-python-pep8-indent')

  " indentation for PHP language
  call minpac#add('2072/PHP-Indenting-for-VIm')

  " syntax highlighting for PHP language
  call minpac#add('2072/vim-syntax-for-PHP')

  " vim indentation for device tree files
  call minpac#add('jyelloz/vim-dts-indent')

  " syntax highlighting and filetype detection for systemd unit files!
  call minpac#add('Matt-Deacalion/vim-systemd-syntax')

  " syntax highlighting for GNU Octave
  call minpac#add('tranvansang/octave.vim')

  " javascirpt syntax highlighting
  call minpac#add('yuezk/vim-js')

  " colorscheme landsape
  call minpac#add('itchyny/landscape.vim')

  " syntax checking plugin
  call minpac#add('vim-syntastic/syntastic')

  " align text
  call minpac#add('junegunn/vim-easy-align')

  " regex search with :Ack
  call minpac#add('mileszs/ack.vim')

  " switch between diff algorithms patience, histogram
  call minpac#add('chrisbra/vim-diff-enhanced')

  " call minpac#add('Yggdroot/indentLine')
  call minpac#add('itchyny/lightline.vim')

  " switch python environment
  call minpac#add('plytophogy/vim-virtualenv')

  " colorscheme gruvbox
  call minpac#add('morhetz/gruvbox')

  " colorscheme vividchalk
  call minpac#add('tpope/vim-vividchalk')

  " indentation guides
  call minpac#add('nathanaelkane/vim-indent-guides')
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})

command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

""" configure how to show whitespace override sensible.vim here
set listchars=tab:>-,trail:~,extends:>,precedes:<,nbsp:+

""" sensible vim configurations
runtime! plugin/sensible.vim

""" use , as <leader> instead of \
let mapleader=","

""" map functionality of, to <c-e>: last c-f, c-t etc in reverse order
nnoremap <c-e> ,

""" configure gui
""" a: autoselect, c: use console instead of popups, g: grey menu items
set guioptions=acg

""" file endings
set ff=unix

""" Let's make it easy to edit this file (mnemonic for the key sequence is
""" 'e'dit 'v'imrc)
nmap <silent> <leader>ev :e $MYVIMRC<cr>

""" 's'ource 'v'imrc
nmap <leader>sv :source $MYVIMRC<cr>

colorscheme gruvbox

set bg=dark

""" configureation for gui
if has("gui_running")
  set background=dark
endif

""" allow buffers to go to background w/out saving etc.
set hidden

""" write as using sudo
command! W w !sudo tee % > /dev/null

""" TAB Completion : 1st longest fit, 2nd list, 3rd cycle
set wildmode=longest,list,full

""" disable modelines
set nomodeline

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

""" Disable wordwrap
set nowrap

""" visual bell
set visualbell

""" hide mousem when typing until moved again
set mousehide

""" timout for pending operator in ms
set timeoutlen=700

""" expand directories to be searched
""" Search upwards and downwards in a directory tree using "*", "**" and ";".
""" See |file-searching| for info and syntax.
set path+=**

""" fold section with from {{{ until }}}
set foldmethod=marker

""" make trailing spaces and tabls visible
set list

""" highlight ColorColumn ctermbg=235 guibg=#2c2d27
set colorcolumn=81

""" these commands autoopen folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

""" Save undo's after file closes
set undofile

""" where to save undo histories
set undodir=$HOME/.vim/undo

""" How many undos
set undolevels=1000

""" number of lines to save for undo
set undoreload=10000

""" ignore whitespace only differences
" set diffopt+=iwhite

""" configure make program
set makeprg=""

nnoremap <F6> :Make<CR>

nnoremap <F5> :!/home/mario/projekte/unity-a2/be4trade/install.sh<CR>

if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience
endif

" === Plugin 'rhysd/vim-clang-format' ==={{{

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
      \ "AllowShortBlocksOnASingleLine"                  : "true",
      \ "AllowShortCaseLabelsOnASingleLine"              : "true",
      \ "AllowShortFunctionsOnASingleLine"               : "Empty",
      \ "AllowShortIfStatementsOnASingleLine"            : "false",
      \ "AllowShortLoopsOnASingleLine"                   : "false",
      \ "AlwaysBreakAfterReturnType"                     : "All",
      \ "AlwaysBreakBeforeMultilineStrings"              : "true",
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
      \ "ColumnLimit"                                    : 80,
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
      \ "SpaceBeforeParens"                              : "Never",
      \ "SpaceInEmptyParentheses"                        : "false",
      \ "SpacesBeforeTrailingComments"                   : 4,
      \ "SpacesInAngles"                                 : "false",
      \ "SpacesInCStyleCastParentheses"                  : "false",
      \ "SpacesInParentheses"                            : "false",
      \ "SpacesInSquareBrackets"                         : "false",
      \ "Standard"                                       : "Cpp03",
      \ "UseTab"                                         : "Never",
\}
"}}}

" ===  Plugin 'tell-k/vim-autopep8' ==={{{

let g:autopep8_max_line_length=79
let g:autopep8_indent_size=2
let g:autopep8_disable_show_diff=1

"}}}

" === Plugin 'mileszs/ack.vim' ==={{{
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"}}}

" ===  Plugin 'vim-syntastic/syntastic' ==={{{

"let g:syntastic_php_checkers = ['php']
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_exec = '~/.composer/vendor/bin/phpcs'
let g:syntastic_php_phpcs_args = '--standard=PSR2'
"let g:syntastic_php_phpmd_exec = '~/.composer/vendor/bin/phpmd'
"let g:syntastic_php_phpmd_post_args = 'cleancode,codesize,controversial,design,unusedcode'

"let g:syntastic_html_tidy_ignore_errors = ['<input> proprietary attribute "role"']
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
"let g:syntastic_html_tidy_blocklevel_tags = []
"let g:syntastic_html_tidy_inline_tags = []
"let g:syntastic_html_tidy_empty_tags = []

"}}}

" === Plugin '2072/PHP-Indenting-for-VIm' ==={{{

let g:PHP_vintage_case_default_indent = 1
let g:PHP_removeCRwhenUnix = 1
let g:PHP_autoformatcomment = 0
let php_sql_query = 0
let php_htmlInStrings = 0
let php_baselib = 0

"}}}

" === Plugin: 'tell-k/vim-autopep8' ==={{{

let g:autopep8_max_line_length=79
let g:autopep8_indent_size=2
let g:autopep8_disable_show_diff=1

"}}}

" ===  Plugin: 'mileszs/ack.vim' ==={{{

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"}}}

" === Plugin: 'vim-syntastic/syntastic' ==={{{

let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = '--standard=psr2'
let g:syntastic_php_phpcs_exec = '~/vendor/bin/phpcs'
let g:syntastic_php_phpmd_exec = '~/vendor/bin/phpmd'
let g:syntastic_php_phpmd_post_args = 'cleancode,codesize,controversial,design,unusedcode'

let g:syntastic_sass_checkers=["sasslint"]
let g:syntastic_scss_checkers=["sasslint"]

"}}}

" === Plugin 'tpope/vim-commentary' ==={{{

autocmd FileType php setlocal commentstring=//\ %s
autocmd FileType cmake setlocal commentstring=#\ %s
autocmd FileType cpp setlocal commentstring=//\ %s

"}}}

" === Plugin 'junegunn/vim-easy-align' ==={{{

"Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"}}}

" === Plugin: 'tpope/vim-commentary' ==={{{

autocmd FileType php setlocal commentstring=//\ %s

"}}}

" === Plugin 'tpope/vim-vinegar' 'netrw' ==={{{

let g:netrw_altfile = 1
let g:netrw_list_hide = '.*\.pyc'

"}}}

" === Plugin 'plytophogy/vim-virtualenv' ==={{{

let g:virtualenv_directory = $HOME."/python-virtualenv"

"}}}

" === Plugin  'tpope/vim-abolish' === {{{

" see: vim/after/plugin/abolish.vim

"}}}

augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

nnoremap <leader>cd :cd %:p:h<cr>
"finish
