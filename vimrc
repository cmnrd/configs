" Set encoding
set encoding=utf-8
set fileencoding=utf-8

" force vim to source .vimrc file if it present in working directory
set exrc
set secure

set nocompatible              " be iMproved, required by Vundle
filetype off                  " required by Vundle


" ----------------------------------------------------------------------------
" Setup trailing white space detection

" Use colors from molokai scheme
highlight ExtraWhitespace ctermfg=219 ctermbg=89 guifg=#E6DB74 guibg=#1E0010
autocmd ColorScheme * highlight ExtraWhitespace ctermfg=219 ctermbg=89 guifg=#E6DB74 guibg=#1E0010

" Always show spaces before a tab and tabs that are not at the start of a line.
" Always show trailing white spaces, except when typing at the end of a  line.
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\| \+\ze\t\|[^\t]\zs\t\+/
au InsertLeave * match ExtraWhitespace /\s\+$\| \+\ze\t\|[^\t]\zs\t\+/


" ----------------------------------------------------------------------------
" Set-up Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Molokai colorsheme
Plugin 'tomasr/molokai'

" Indent guides (for soft tabs)
Plugin 'Yggdroot/indentLine'

" Insert spaces when hitting tab in middle of line
Plugin 'vim-scripts/Smart-Tabs'

" status line
Plugin 'bling/vim-airline'

" enhanced C++ highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'

" git support
Plugin 'tpope/vim-fugitive'

" File Manager
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


" ----------------------------------------------------------------------------
" Set-up color scheme (Molokai)

set t_Co=256         " use 256 colors, required
let g:rehash256 = 1
colorscheme molokai
syntax enable

" ----------------------------------------------------------------------------
" Default tab settings

set tabstop=4
set shiftwidth=4

" Show tabs
set list lcs=tab:\»\ ,trail:·

let g:indentLine_char = '┊'

" ----------------------------------------------------------------------------
" Appearance

" always show status line
set laststatus=2
set number
set colorcolumn=80

highlight ColorColumnError ctermfg=219 ctermbg=89 guifg=#E6DB74 guibg=#1E0010
call matchadd('ColorColumnError', '\%81v', 100)

" ----------------------------------------------------------------------------
" Airline

" only check for trailing white spaces
let g:airline#extensions#whitespace#checks = [ 'trailing' ]

let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#enabled = 1

" ----------------------------------------------------------------------------
" NERDTree

" close on open
let g:NERDTreeQuitOnOpen = 1

map <C-d> :NERDTreeToggle<CR>
