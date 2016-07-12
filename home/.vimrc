set encoding=utf-8
set langmenu=en_US.UTF-8         " Language of the menu (gVim)
language messages en_US.UTF-8    " Language of the messages/UI (Vim)
set clipboard-=autoselect        " Do not auto-yank Visual mode selection
if has("win32") || has("win64")
    set directory=$TEMP,.        " Swap file fix under Windows
    set backupdir=$TEMP,.        " Change backup directory too
    if has("gui_win32")
        cd $USERPROFILE          " Set starting directory
        set clipboard^=unnamed   " Clipboard integration in Windows
    endif
endif
if has('unnamedplus')
    set clipboard^=unnamedplus   " Clipboard integration with X11
endif

" Initialization
"=========================================================================
set nocompatible        " Turn off Vi compatibility for all Vim features
set cpo+=$              " Show '$' after the last character to be changed
let mapleader=" "       " Change the mapleader from \ to <space>
filetype off            " Ensure adding ftdetect scripts below always work
let g:myplug_flags=[]   " Enable plugins by adding flags, see .vimrc_plugins
if filereadable(expand("~/.vimrc_local_init"))
    source ~/.vimrc_local_init
endif

" Plugins
"=========================================================================
if filereadable(expand("~/.vimrc_plugins"))
    source ~/.vimrc_plugins
elseif filereadable(expand("~/.vimrc_plugout"))
    source ~/.vimrc_plugout
endif

" Basic editing behaviour
"=========================================================================
set timeoutlen=700     " Waits max this long between keys in mappings
set ttimeoutlen=100    " Waits max this long between key codes
set mouse=a            " Enable mouse in all modes
set ttymouse=xterm2    " Terminal type for mouse codes

set hidden             " Buffer is hidden, not unloaded, when abandoned
set number             " Always show line numbers
set showmatch          " Set show matching parenthesis
set wrap               " Enable long line wrapping
set linebreak          " Wrap long lines at 'breakat'; only if 'nolist'

set textwidth=80       " A longer line will be broken after white space
set fo=croqln          " Options for automatic formatting, see fo-table
set wrapmargin=0       " Wrapping from the right window border disabled

set tabstop=4          " A tab is N spaces --- tedlogan.com/techblog3.html
set expandtab          " Always expand <tab> to spaces
set shiftwidth=4       " N spaces to use for autoindenting
set softtabstop=4      " Tab is N spaces in Insert mode
set backspace=2        " Allow i_backspacing over indent, eol, and start
set autoindent         " Always set autoindenting on
set copyindent         " Copy the previous indentation on autoindenting
set smartindent        " For C-like programs. Also see :h C-indenting
set shiftround         " Use multiples of 'sw' upon < and >
set smarttab           " Insert tabs at ^ according to'sw', not 'ts'

set hlsearch           " Highlight search terms. Switch off with :nohls
set ignorecase         " Ignore case when searching. 'scs' overrides this
set smartcase          " Ignore case if search pattern is all lowercase
set incsearch          " Show search matches as you type

set splitbelow         " More natural :split behaviour
set splitright         " More natural :vsplit behaviour
augroup myaugroup_PreviewOnTop
    autocmd InsertEnter * set nosplitbelow
    autocmd InsertLeave * set splitbelow
augroup END

" Advanced editing behaviour
"=========================================================================
set noautoread         " Do not autoread files changed outside Vim
set noautowrite        " Do not write changed contents on certain commands
set noautowriteall     " Like 'noautowrite', but on more commands

set nolist             " Disable whitespace visual aids. See 'lcs'
set listchars=tab:>.,trail:.,extends:#,nbsp:~

set scrolloff=5        " Min. lines to keep above and below cursor
set sidescrolloff=10   " Min. cols to left and to right of cursor
set sidescroll=1       " Min. cols to scroll horizontally

set display+=lastline  " Always show last line instead of @ signs
set display+=uhex      " Show unprintable characters hexadecimal as <xx>

" Folds
"-------------------------------------------------------------------------
set foldmethod=indent  " Fold based on indent
set foldnestmax=3      " Deepest fold is N levels
set nofoldenable       " Do not fold by default

" History
"-------------------------------------------------------------------------
set undodir=~/.vim/undodir " Persistent undo does not work unless exists
set undofile               " Enable persistent undo
set undolevels=1000        " Use this many of levels of undo
set history=1000           " Remember more commands and search history

" Enhanced completion
"-------------------------------------------------------------------------
set wildchar=<tab>                " See cmdline-completion
set wildcharm=<c-z>               " Like wildchar, but inside a macro
set wildmode=longest:full,full    " Enhanced command line completion
set wildignore=*.o,*.obj,*~       " Stuff to ignore when tab completing
sil! set wildignorecase           " When completing file and dir names
set wildmenu                      " Scroll thru matches by C-n and C-p
                                  " Insert mode completion enhancement
set completeopt=menuone,longest,preview
set complete+=kspell              " Complete with dict if spell check on

" Tags and special searches                              tags-and-searches
"-------------------------------------------------------------------------
set tags=./tags;

" File type plugins
"=========================================================================
filetype plugin indent on
augroup myaugroup_FileType
    autocmd FileType make set noexpandtab
    autocmd FileType gitconfig set noexpandtab
    autocmd FileType python
        \ set textwidth=79 |
        \ set fileformat=unix |
        \ let python_highlight_all=1
augroup END

" Other options
"=========================================================================
set ssop+=resize,winpos  " Changes the effect of :mksession

" Status line and other indicators
"=========================================================================
set laststatus=2         " Always show the status line
set ruler                " Show the cursor position
set showmode             " Show the current mode
set title                " Show the filename in the window titlebar
set showcmd              " Show the (partial) command as it is being typed
set colorcolumn=+0       " Show the print margin
set cursorline           " Highlight the screen line of the cursor

" Colors
"=========================================================================
" If colors via Putty funny, set term-type to 'putty-256color' in Putty.
" If still color issues, open a new line below containing 'set t_Co=16'.
if &t_Co > 2 || has("gui_running") || !empty($CONEMUBUILD)
    syntax on                              " Minimum setting (>=2-color)
    set background=dark                    " Overwritten in gvimrc
endif

" Color scheme settings per environment
"-------------------------------------------------------------------------
if !empty($CONEMUBUILD)                    " ConEmu settings (=256-color)
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    sil! colorscheme zenburn               " Works with generic 256-colors
elseif &t_Co >= 16 || has("gui_running")   " Solarized only (>=16-color)
    let g:solarized_contrast="high"        " Default is normal
    let g:solarized_diffmode="high"        " Default is normal
    let g:solarized_hitrail=1              " Default is 0
    sil! colorscheme solarized             " Needs own 16-color palette
endif

" Mappings                     " NB No comment in same line as map command
"=========================================================================
" Exiting Insert mode: <M-j> jj jk kj fd ;; ,,
inoremap <silent> jk <Esc>
" A bit more convenient access to Ex commands
nnoremap <CR> :
" Always jump to the next screen row
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> gj j
nnoremap <silent> gk k
" Quickly clear the search buffer
nnoremap <silent> <leader>sc :nohls<CR>
" Do not jump to next occurrence on *
noremap <silent> * :let @/='\<'.expand('<cword>').'\>'\|set hls<CR>
noremap <silent> g* :let @/=expand('<cword>')\|set hls<CR>
" Shift selected lines and keep them selected
vnoremap <silent> < <gv
vnoremap <silent> > >gv
" Do not yank deleted text
nnoremap <silent> ,d "_d
vnoremap <silent> ,d "_d

" Relative line number toggle
nnoremap <silent> <leader>tr :if &rnu\|se nornu nu\|else\|se nu rnu\|en<CR>
" Disable format options when pasting for sanity
nnoremap <silent> <F2> :set invpaste<CR>

" Quickly edit/reload the configuration file
nnoremap <leader>fed :e ~/.vimrc*<c-z>
nnoremap <silent> <leader>feR :so $MYVIMRC<CR>

" Cycle thru buffers, easier buffer switching
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bp :bprevious<CR>
nnoremap <silent> <leader><tab> :b#<CR>
nnoremap <leader>bb :ls<CR>:b<space>

" Explore directory of current file
nnoremap <leader>fj :Explore!<CR>

" Local config
"=========================================================================
if filereadable(expand("~/.vimrc_local"))
    source ~/.vimrc_local
endif

