if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd!
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
    " plugins go here
    Plug 'preservim/nerdtree'
    Plug 'airblade/vim-gitgutter'
    Plug 'doums/darcula'
    Plug 'alvan/vim-php-manual', {'for': 'php'}
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

colorscheme darcula
set termguicolors

set number
set relativenumber
set autoindent
set smartindent

set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set updatetime=100

" Nerdtree config.

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" open folders with spacebar
let NERDTreeMapActivateNode='<space>'

" size on open
let g:NERDTreeWinSize=40

" remap open button to <LCTRL>+G
map <C-g> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
