" -------------------
" | VUNDLE SETTINGS |
" -------------------
set nocompatible              " be iMproved, required
filetype off                  " required

let $PYTHONPATH='/usr/lib/python3.5/site-packages'

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
" - MyVundle Bundles
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic.git'
Bundle 'rodjek/vim-puppet'
Bundle 'davidhalter/jedi-vim'
Bundle 'lervag/vimtex'
Bundle 'ldap_schema'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ---------------------
" | PERSONAL SETTINGS |
" ---------------------

" NERDTree
map <F2> :NERDTreeToggle<CR>

" Always show status line

"set rtp+=/usr/lib/python3.5/site-packages/powerline/bindings/vim
set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2

" enable syntax color
syntax enable

" Solarized
"set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
if &term =~ '256color'
	  " disable Background Color Erase (BCE) so that color schemes
	  "   " render properly when inside 256-color tmux and GNU screen.
	  "     " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
   set t_ut=
endif

" line number
set number

" Searching options.
set hlsearch
set incsearch
set ignorecase
set smartcase

" Catch whitespaces..
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" map Ctrl+w to vsplit  - leave trailing space character
nmap <C-w> <esc>:vsplit 
nmap <C-x> <esc>:split 

nmap <C-p> <esc>:set paste<CR>
" move between split buffers
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nmap <C-s> <esc>:w<CR>
vmap <C-s> <esc>:w<CR>
inoremap <C-s> <Esc>:w<CR>
