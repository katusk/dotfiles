" GUI related settings
"=========================================================================
set lines=30 columns=90                 " Start GUI with sane dimensions
set background=light                    " Use light color scheme variant
set guicursor+=a:blinkon0               " Disable cursor blinking
set guioptions-=T                       " Turn off gVim toolbar
set guioptions+=rRlLbMm                 " Need to add all to remove them
set guioptions-=rRlLbMm                 " Remove all scroll bars and menu

" Font setup
"-------------------------------------------------------------------------
if has("gui_gtk2")
    set guifont=Inconsolata\ Medium\ 12
elseif has("gui_win32")
    set guifont=Consolas:h12:cDEFAULT   " Or Inconsolata:h12:b
endif

