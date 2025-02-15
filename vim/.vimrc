if &compatible
  set nocompatible
endif

call plug#begin()

Plug 'dracula/vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jyelloz/vim-dts-indent'
Plug 'mileszs/ack.vim'
Plug 'rhysd/vim-clang-format'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-syntastic/syntastic'
Plug 'yuezk/vim-js'

call plug#end()

""" configure how to show whitespace override sensible.vim here
set listchars=tab:>-,trail:~,extends:>,precedes:<,nbsp:+

""" sensible vim configurations
runtime! plugin/sensible.vim

""" use , as <leader> instead of \
let mapleader = ","

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

set bg=dark

""" configureation for gui
if has("gui_running")
  set background=dark
endif

""" allow buffers to go to background w/out saving etc.
set hidden

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

set mouse=nvicrv

""" timout for pending operator in ms
set timeoutlen=700

""" expand directories to be searched
""" Search upwards and downwards in a directory tree using "*", "**" and ";".
""" See |file-searching| for info and syntax.
set path+=**

""" fold section with from {{{ until }}}
set foldmethod=manual

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

""" configure make program
set makeprg=""

nnoremap <F5> :!$HOME/bin/install.sh<CR>

augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

nnoremap <leader>cd :cd %:p:h<cr>

let g:netrw_altfile = 1
let g:netrw_list_hide = '.*\.swp$,.*\.pyc$'

if !empty($FULLNAME) && !empty($EMAIL)
  let g:changelog_username = printf("%s <%s>", $FULLNAME, $EMAIL)
endif
let g:changelog_new_date_format = "%d  %u\n\n    *%c"
let g:changelog_new_entry_format = "    *%c"
let g:changelog_spacing_errors = 0

autocmd BufNewFile,BufRead CHANGELOG set filetype=changelog

""" Plugin configuration

""" search .clang-format or _clang-format yaml configuration
let g:clang_format#detect_style_file = 1

let g:autopep8_max_line_length = 80
let g:autopep8_indent_size = 2
let g:autopep8_disable_show_diff = 1

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = '--standard=PSR2'
let g:syntastic_php_phpcs_exec = '~/vendor/bin/phpcs'
let g:syntastic_php_phpmd_exec = '~/vendor/bin/phpmd'
let g:syntastic_php_phpmd_post_args = 'cleancode,codesize,controversial,design,unusedcode'
let g:syntastic_html_tidy_ignore_errors = [" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
let g:syntastic_sass_checkers = ["sasslint"]

let g:syntastic_cpp_include_dirs = ['/home/mario/projekte/ssclib']

""" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

""" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nnoremap <F6> :Make<CR>

colorscheme dracula

"finish
