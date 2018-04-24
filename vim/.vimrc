"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around and searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " highlight matches
set ignorecase          " ignore case whe using a search pattern
set smartcase           " be smart about cases

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs and indenting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab           " use spaces instead of tabs
set smarttab            " Be smart when using tabs ;)
set tabstop=2           " spaces to insert when using <TAB>
set shiftwidth=2        " space character for indentation

set autoindent
set smartindent 
set wrap                " Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UI Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler               " Always show current position
set number              " Show line number
if exists('g:+relativenumber') || (v:version > 700)
  set relativenumber    " relative number to the cursos line 
endif

set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching brackets
set noeb novb t_vb=     " No annoying sound on error

filetype indent on      " load filetype-sepecific indent files

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable          " enable folding
set foldmethod=indent   " fold based on indent level
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" space open/close folds
nnoremap <leader>z za

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"    " leader is space bar


" Remap VIM 0 to first non-blank character
nmap <leader>0 ^

" +-- Saving
" Fast saving
"nmap <leader>w :w!<cr>
"nmap <leader>wq :wq<cr>
" Fast quitting
nmap <leader>q :q<cr>
nmap <leader>q! :q!<cr>
" :W sudo saves the file 
"command W w !sudo tee % > /dev/null

" +-- Tabs
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>h :tabp<cr>
map <leader><Left> :tabp<cr>
map <leader>l :tabn<cr>
map <leader><Right> :tabn<cr>
" Opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Quickly open a buffer for scribble
map <leader>pp :setlocal paste!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plug config
call plug#begin('~/.vim/bundle')
Plug 'morhetz/gruvbox'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set noswapfile
"set nobackup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Various
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &term == "screen"
  set t_Co=256
endif
set background=dark

colorscheme gruvbox

set hidden             " A buffer becomes hidden when it is abandoned
set encoding=utf8      " Set utf8 as standard encoding and es the standard language
set ffs=unix,dos,mac   " Use Unix as the standard file type
set backspace=indent,eol,start   " make the backspace work like most programs

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
\ endif