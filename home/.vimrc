set encoding=utf-8
set langmenu=en_US.UTF-8         " Language of the menu (gVim)
language messages en_US.UTF-8    " Language of the messages/UI (Vim)
if has("win32") || has("win64")
    set directory=$TEMP,.        " Swap file fix under Windows
    set backupdir=$TEMP,.        " Change backup directory too
    cd $USERPROFILE              " Set starting directory
endif              " $HOME --- markmail.org/message/wbzs4gmtvkbewgxi

" Vi compatibility and related options
"====================================================================
set nocompatible   " Turn off Vi compatibility for all Vim features
set cpo+=$         " Show '$' after the last character to be changed

" Vundle for the easy bundling and updating of plugins
"====================================================================
if has("win32") || has("win64")
    set rtp+=$USERPROFILE\.vim\bundle\vundle\
else
    set rtp+=~/.vim/bundle/vundle/
endif
call vundle#rc()
filetype off

" Bundling plugins --- using vundle instead of 'tpope/vim-pathogen'
"--------------------------------------------------------------------
Bundle 'gmarik/vundle'
" Color themes
Bundle 'altercation/vim-colors-solarized'
Bundle 'jnurmine/Zenburn'
Bundle 'tomasr/molokai'
" Syntax
Bundle 'http://bitbucket.org/alexcolson/kdb-vim.git'
Bundle 'octol/vim-cpp-enhanced-highlight'
" Navigation
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
" Version control
Bundle 'airblade/vim-gitgutter'

" Pathogen for the easy bundling of plugins --- using vundle instead
"====================================================================
" call pathogen#infect()     " Include subdirs under ~/.vim/bundle
" call pathogen#helptags()   " Generate help tags for those plugins

" Basic editing behaviour
"====================================================================
set hidden        " Buffer is hidden, not unloaded, when abandoned
set number        " Always show line numbers
set showmatch     " Set show matching parenthesis
set wrap          " Enable long line wrapping
set linebreak     " Wrap long lines at 'breakat'; only if 'nolist'

set tabstop=4     " A tab is N spaces --- tedlogan.com/techblog3.html
set expandtab     " Always expand <Tab> to spaces
set shiftwidth=4  " N spaces to use for autoindenting
set softtabstop=4 " Tab is N spaces in Insert mode
set backspace=2   " Allow i_backspacing over indent, eol, and start
set autoindent    " Always set autoindenting on
set copyindent    " Copy the previous indentation on autoindenting
set shiftround    " Use multiples of 'sw' upon '<' and '>'
set smarttab      " Insert tabs at ^ according to'sw', not 'ts'

set hlsearch      " Highlight search terms. Switch off with :nohls
set ignorecase    " Ignore case when searching. 'scs' overrides this
set smartcase     " Ignore case if search pattern is all lowercase
set incsearch     " Show search matches as you type

" Advanced editing behaviour
"====================================================================
set nolist              " Disable whitespace visual aids. See 'lcs'
set listchars=tab:>.,trail:.,extends:#,nbsp:~

set scrolloff=5         " Min. lines to keep above and below cursor
set sidescrolloff=10    " Min. cols to left and to right of cursor
set sidescroll=1        " Min. cols to scroll horizontally

" Folds
"''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
set foldmethod=indent   " Fold based on indent
set foldnestmax=3       " Deepest fold is N levels
set nofoldenable        " Do not fold by default

" History
"--------------------------------------------------------------------
set history=1000        " Remember more commands and search history
set undolevels=1000     " Use this many of levels of undo
if has("win32") || has("win64")
    set undodir=$USERPROFILE\vimfiles\undodir
else
    set undodir=~/.vim/undodir
endif
set undofile            " Enable persistent undo

" File type plugins
"--------------------------------------------------------------------
filetype plugin indent on
autocmd filetype make set noexpandtab
autocmd filetype python set expandtab

" Syntax highlighting, (G)UI related settings
"====================================================================
" set t_Co=16   " Putty, Connection > Data, term-type: putty-256color
if &t_Co >= 16 || has("gui_running")
    let g:solarized_contrast="high"        " Default is 'normal'
    let g:solarized_diffmode="high"        " Default is 'normal'
    let g:solarized_hitrail=1              " Default is '0'
    colorscheme solarized                  " Or try 'zenburn'
endif
if &t_Co > 2 || has("gui_running")
    syntax on
endif
if has("gui_running")
    set background=light
    set guicursor+=a:blinkon0              " Disable cursor blinking
    set guioptions-=T                      " Turn off gVim toolbar
    set guioptions+=rRlLb
    set guioptions-=rRlLb                  " Remove all scroll bars
    if has("gui_gtk2")
        set guifont=Inconsolata\ Medium\ 12
    elseif has("gui_win32")
        set guifont=Consolas:h12:cDEFAULT  " Or 'Inconsolata:h12:b'
    endif
else
    set background=dark
endif

" Enhanced mode for command-line completion
"''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
set wildmode=list:longest
set wildignore=*.o,*.obj,*~    " Stuff to ignore when tab completing
set wildmenu                   " Scroll thru matches by C-n and C-p

" Mappings --- NB No comment in same line as map command
"====================================================================
set pastetoggle=<F2>           " Paste mode toggle not to get crazy
let mapleader=","              " Change the mapleader from '\' to ','
" Quick way to clear the search buffer. Also see :noh
nmap <silent> ,/ :nohls<CR>
" Other good alternatives for exiting Insert mode: <M-j> jk ;; ,,
inoremap ,, <Esc>

" Quickly edit/reload the vimrc file
"''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" If line wrapping is enabled, jump to the next screen row in case of
" a long wrapped line, instead of jumping over to the next line
"''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
nnoremap j gj
nnoremap k gk

" Easy window navigation
"''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l

" Get a life, get a sane status line
"====================================================================
set laststatus=2   " Always show the status line
" See http://learnvimscriptthehardway.stevelosh.com/chapters/17.html

" Other indicators
"''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
set ruler          " Show the cursor position
set showmode       " Show the current mode
set title          " Show the filename in the window titlebar
set showcmd        " Show the (partial) command as it is being typed
set colorcolumn=80 " Show the print margin
set cursorline     " Highlight the screen line of the cursor

" Plugin settings
"====================================================================

" Airline                                               :help airline
"--------------------------------------------------------------------
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#tabline#right_sep=''
let g:airline#extensions#tabline#right_alt_sep=''

" NERDTree                                            :help NERD_tree
"--------------------------------------------------------------------
let NERDTreeDirArrows=0

" Tagbar                                  majutsushi.github.io/tagbar
"--------------------------------------------------------------------
let g:tagbar_iconchars=['+', '-']

" CtrlP                                      kien.github.io/ctrlp.vim
"--------------------------------------------------------------------
let g:ctrlp_show_hidden=0
let g:ctrlp_max_files=8000
let g:ctrlp_lazy_update=120

" Gitgutter              github.com/airblade/vim-gitgutter/issues/164
"--------------------------------------------------------------------
highlight clear SignColumn                   " theme color is strange
call gitgutter#highlight#define_highlights() " reload gitgutter color

" Eclim                            eclim.org/vim/code_completion.html
"--------------------------------------------------------------------
let g:EclimCompletionMethod='omnifunc'

" Reference
"====================================================================
" Check out the following links for more .vimrc related goodies.
" -- github.com/tpope/vim-pathogen
" -- nvie.com/posts/how-i-boosted-my-vim
" -- github.com/derekwyatt/vim-config
" -- paulgorman.org/technical/dotfiles/vimrc.txt
" -- dotfiles.github.io

