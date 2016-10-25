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

" key mappings
Plugin 'tpope/vim-unimpaired'

" File Manager
Plugin 'scrooloose/nerdtree'

" Fuzzy file search
Plugin 'kien/ctrlp.vim'

" Easily surround words with parantheses, brackts, etc.
Plugin 'tpope/vim-surround'

" Better Plugin support for repeat ('.') 
Plugin 'tpope/vim-repeat'

" Auto completition
Plugin 'Valloric/YouCompleteMe'

" Fast comment lines and block
Plugin 'scrooloose/nerdcommenter'

" User defined operators
Plugin 'kana/vim-operator-user'

" Clang format
Plugin 'rhysd/vim-clang-format'

" Syntastic
Plugin 'scrooloose/syntastic'

" autopep8
Plugin 'tell-k/vim-autopep8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" fix backspace and delete keys
set backspace=indent,eol,start

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

" ----------------------------------------------------------------------------
" NERDTree

" close on open
let g:NERDTreeQuitOnOpen = 1

map <C-d> :NERDTreeToggle<CR>

" ----------------------------------------------------------------------------
" CtrlP

" key mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

" ----------------------------------------------------------------------------
" YCM

let g:ycm_autoclose_preview_window_after_insertion = 1

" ----------------------------------------------------------------------------
" Clang Format

let g:clang_format#code_style = 'mozilla'
let g:clang_format#style_options = {
    \ "Standard" : "C++11",
    \ "ColumnLimit" : "80",
    \ "UseTab" : "Never",
    \ "TabWidth" : "4",
    \ "BinPackParameters" : "false",
    \ "BinPackArguments" : "false"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" expand tabs in tex mode
autocmd Filetype tex setlocal ts=2 sw=2 expandtab

so ~/.vimrc_local
