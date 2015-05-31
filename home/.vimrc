set encoding=utf-8
set langmenu=en_US.UTF-8         " Language of the menu (gVim)
language messages en_US.UTF-8    " Language of the messages/UI (Vim)
if has("win32") || has("win64")
    set directory=$TEMP,.        " Swap file fix under Windows
    set backupdir=$TEMP,.        " Change backup directory too
    if has("gui_win32")
        cd $USERPROFILE          " Set starting directory
        set clipboard+=unnamed   " Clipboard integration in Windows
    endif
endif
if has('unnamedplus')
    set clipboard+=unnamedplus   " Clipboard integration with X11
endif

" Initialization
"=========================================================================
set nocompatible        " Turn off Vi compatibility for all Vim features
set cpo+=$              " Show '$' after the last character to be changed
filetype off            " Ensure adding ftdetect scripts below always work

" Plugins managed by Vundle
"=========================================================================
set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" Dependencies
Plugin 'xolox/vim-misc'                  " Required by xolox/vim-easytags
Plugin 'MarcWeber/vim-addon-mw-utils'    " Required by garbas/vim-snipmate
Plugin 'tomtom/tlib_vim'
" Interoperability
Plugin 'nvie/vim-togglemouse'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-repeat'
Plugin 'jpalardy/vim-slime'
Plugin 'richsoni/vim-ecliptic'
" Color themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'tomasr/molokai'
" Syntax highlighting
Plugin 'http://bitbucket.org/alexcolson/kdb-vim.git'
Plugin 'octol/vim-cpp-enhanced-highlight'
" Navigation
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'derekwyatt/vim-fswitch'
" Version control
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" Code analysis and completion
Plugin 'xolox/vim-easytags'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" Pretty printing
Plugin 'Chiel92/vim-autoformat'
" Editing
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'godlygeek/tabular'
call vundle#end()

" Basic editing behaviour
"=========================================================================
set timeoutlen=500     " Waits this long between keys in key sequence
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
set wildignorecase                " When completing file and dir names
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
autocmd FileType make set noexpandtab
autocmd FileType gitconfig set noexpandtab
autocmd FileType python set expandtab

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
set colorcolumn=80       " Show the print margin
set cursorline           " Highlight the screen line of the cursor

" Colors and GUI related settings
"=========================================================================
" If colors via Putty funny, set term-type to 'putty-256color' in Putty.
" If still color issues, open a new line below containing 'set t_Co=16'.
if &t_Co > 2 || has("gui_running")
    syntax on
endif
if has("gui_running")
    set lines=30 columns=90
    set background=light
    set guicursor+=a:blinkon0              " Disable cursor blinking
    set guioptions-=T                      " Turn off gVim toolbar
    set guioptions+=rRlLb
    set guioptions-=rRlLb                  " Remove all scroll bars
    if has("gui_gtk2")
        set guifont=Inconsolata\ Medium\ 12
    elseif has("gui_win32")
        set guifont=Consolas:h12:cDEFAULT  " Or Inconsolata:h12:b
    endif
else
    set background=dark
endif

" Color scheme specific settings
"-------------------------------------------------------------------------
if &t_Co >= 16 || has("gui_running")
    let g:solarized_contrast="high"        " Default is normal
    let g:solarized_diffmode="high"        " Default is normal
    let g:solarized_hitrail=1              " Default is 0
    colorscheme solarized                  " Or try zenburn
endif

" Mappings               " NB No comment in same line as map command
"=========================================================================
set pastetoggle=<F2>     " Disable format options when pasting for sanity
let mapleader=","        " Change the mapleader from \ to ,
                         " Quickly clear the search buffer
nmap <silent> <leader>/ :nohls<CR>
                         " Exiting Insert mode: <M-j> jk ;; ,,
inoremap <leader>, <Esc>
                         " Quickly edit/reload the vimrc file
nmap <silent> <leader><S-E> :e $MYVIMRC<CR>
nmap <silent> <leader><S-S> :so $MYVIMRC<CR>
                         " Always jump to the next screen row
nnoremap j gj
nnoremap k gk
                         " Cycle thru buffers, easier buffer switching
nnoremap <silent> <leader>, :bnext<CR>
nnoremap <silent> <leader>. :bprevious<CR>
nnoremap <silent> <leader># :b#<CR>
nnoremap <leader>b :ls<CR>:b<space>
                         " Do not jump to next occurrence on *
map <silent> * :let @/ = '\<'.expand('<cword>').'\>'\|set hls<CR>
map <silent> g* :let @/ = expand('<cword>')\|set hls<CR>
                         " Relative line number toggle
nmap <silent> <leader>r :set relativenumber!<CR>
                         " Explore directory of current file
nmap <leader>e :Explore!<CR>

" Plugin mappings        " NB No comment in same line as map command
"=========================================================================
nmap <F3> :NERDTreeToggle<CR>
nmap <F4> :TagbarToggle<CR>
                         " Autoformat. Also see gq{motion}
nnoremap <leader>q :Autoformat<CR>
                         " Tabularize with ease
nnoremap <leader>t :Tabularize /
vnoremap <leader>t :Tabularize /
                         " FSwitch. See github.com/derekwyatt/vim-fswitch
nmap <silent> <leader>a :FSHere<CR>
                         " SuperTab. Note: tab is used by SnipMate
let g:SuperTabMappingForward='<leader><tab>'
let g:SuperTabMappingBackward='<nop>'
let g:SuperTabMappingTabLiteral='<nop>'
                         " CtrlP
let g:ctrlp_map='<c-p>'
                         " Vim-Slime
nmap <Plug>NoSlimeParagraphSend <Plug>SlimeParagraphSend
nmap <c-c><c-c> <Plug>SlimeLineSend

" Plugin settings
"=========================================================================

" Airline                                                    :help airline
"-------------------------------------------------------------------------
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#tabline#right_sep=''
let g:airline#extensions#tabline#right_alt_sep=''

" NERDTree                                                 :help NERD_tree
"-------------------------------------------------------------------------
let NERDTreeMouseMode=2
let NERDTreeDirArrows=0
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeShowBookmarks=1
let NERDTreeBookmarksFile=expand('~/.vim/NERDTreeBookmarks')

" Tagbar                                       majutsushi.github.io/tagbar
"-------------------------------------------------------------------------
let g:tagbar_iconchars=['+', '-']
let g:tagbar_compact=1

" Easytags                               peterodding.com/code/vim/easytags
"-------------------------------------------------------------------------
let g:easytags_dynamic_files=2
let g:easytags_include_members=1
let g:easytags_events=['BufReadPost', 'BufWritePost']
let g:easytags_syntax_keyword='always'
let g:easytags_auto_update=1
let g:easytags_auto_highlight=1
let g:easytags_async=1

" CtrlP                                           kien.github.io/ctrlp.vim
"-------------------------------------------------------------------------
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_show_hidden=1
let g:ctrlp_max_files=8000
let g:ctrlp_lazy_update=120

" Gitgutter                   github.com/airblade/vim-gitgutter/issues/164
"-------------------------------------------------------------------------
highlight clear SignColumn                       " theme color is strange
if exists("*gitgutter#highlight#define_highlights")
    call gitgutter#highlight#define_highlights() " reload gitgutter color
endif

" Syntastic           github.com/scrooloose/syntastic/wiki/Syntax-Checkers
"-------------------------------------------------------------------------
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1

" SuperTab                                    github.com/ervandew/supertab
"-------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType='context'
let g:SuperTabContextDefaultCompletionType='<c-x><c-o>'
let g:SuperTabRetainCompletionDuration='completion'
let g:SuperTabClosePreviewOnPopupClose=1
let g:SuperTabLongestEnhanced=1

" EditorConfig                    github.com/editorconfig/editorconfig-vim
"-------------------------------------------------------------------------
let g:EditorConfig_exclude_patterns=['fugitive://.*']

" Vim-Slime                                  github.com/jpalardy/vim-slime
"-------------------------------------------------------------------------
let g:slime_target="tmux"
let g:slime_default_config={"socket_name": "default", "target_pane": "1"}
let g:slime_python_ipython=1

" Eclim                                 eclim.org/vim/code_completion.html
"-------------------------------------------------------------------------
let g:EclimCompletionMethod='omnifunc'

