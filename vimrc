set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
" do the following:
" sudo apt-get install build-essential cmake
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py --clang-completer
Bundle 'Valloric/YouCompleteMe'

Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic' " check syntax
Plugin 'nvie/vim-flake8' " P8P checkin
Plugin 'jnurmine/Zenburn' " color scheme
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" set line number
set number

" set tab setting
set splitbelow
set splitright

"split navigations
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
" nnoremap <space> za

" PEP8 Indentation
au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=79 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix

" flag bad whitespaces
highlight BadWhitespace ctermfg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" highlight SpecialKey ctermfg=Red
" set listchars=tab:>-,trail:~
" set list
" UTF-8 support
set encoding=utf-8

" autocomplete goes away when completed
let g:ycm_autoclose_preview_window_after_completion=1

" shortcut for goto definition
let mapleader = "\<Space>"
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" map save key
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" make code looks pretty
let python_highlight_all=1
syntax on

"activate color scheme
colorscheme zenburn

" activate powerline
set laststatus=2
set t_Co=256

" set bracket colors
hi MatchParen cterm=bold ctermbg=none ctermfg=yellow

" run python and python3 using F5 and F6 respectively
nnoremap <buffer> <F5> :w<CR> :execute '!python' shellescape(@%, 1)<cr>
nnoremap <buffer> <F6> :w<CR> :execute '!python3' shellescape(@%, 1)<cr>
