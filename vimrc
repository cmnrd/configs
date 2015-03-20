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

" ----------------------------------------------------------------------------
" Airline

" only check for trailing white spaces
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
