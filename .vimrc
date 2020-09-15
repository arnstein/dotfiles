" Arnsteins .vimrc file

" Add this line to .bashrc to swap caps lock and escape:
" /usr/bin/setxkbmap -option "caps:swapescape"

set nocompatible
filetype off

" Setting up Vundle - the vim plugin manager
let installVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let installVundle=0
endif
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized' "Colorscheme
Plugin 'https://github.com/tpope/vim-fugitive' "Git + Vim = true
Plugin 'tpope/vim-sensible' "Sensible vim
Plugin 'arnstein/yoctolog.vim' "Yocto log syntax
Plugin 'vim-syntastic/syntastic' "Syntax checking
Plugin 'rust-lang/rust.vim' "Syntax checking
Plugin 'tpope/vim-surround' "Easy surrounding fixing
Plugin 'sjl/gundo.vim' "Visualization of Vim undo tree
Plugin 'vhda/verilog_systemverilog.vim'
" SnipMate and dependencies
Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'neoclide/coc.nvim'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
"Plugin 'Valloric/YouCompleteMe' "YouCompleteMe autocomplete
Plugin 'vim-airline'
Plugin 'vim-airline/vim-airline-themes'
if installVundle == 0
    echo "Installing plugins, please ignore key map error messages"
    :PluginInstall
endif
call vundle#end()
filetype plugin indent on
set nocp

" Enable syntax
if has("syntax")
  syntax on
endif

" Snipmate mapping
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" Settings for YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui=0

" Airline theme
let g:airline_theme='solarized'

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Removes preview window of functions in Python when you've chosen one
 autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
 autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Move a line of text using alt+[jk] or command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Auto read when a file is changed from the outside
set autoread

" F5 to visualize undo tree
nnoremap <F5> :GundoToggle<CR>

" Use za to open and close a fold
set foldmethod=indent
set foldlevel=99

" Turn on the WiLd menu
set wildmenu

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
j

" Ignore case when searching
set ignorecase

" Highlight search results and remove the highlight when pressing enter
set hlsearch
nnoremap <CR> :noh<CR><CR>

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Fast saving
nmap <leader>w :w!<cr>

" Fast make
nmap <leader>m :!make<cr>

" Wrap lines
set wrap

" Sets how many lines of history VIM has to remember
set history=700

" Enables mouse
set mouse=a

" Enable line numbers
set number

" Enable clipboard
set clipboard=unnamedplus

" Auto copy text highlighted by mouse in Windows
set guioptions+=a

" Proper tab indent
set softtabstop=4
set shiftwidth=4
set expandtab
set cindent


if (&ft=='v' || &ft=='sv' || &ft=='scala')
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
endif

" Auto indent
set ai

" Smart indent
set si

" Disable syntastic for Scala, as it makes saving slow
let g:syntastic_mode_map = { 'passive_filetypes': ['scala'] }

" Colorscheme and syntax highlighting
syntax enable
set term=screen-256color
set t_Co=256
set background=light
let g:solarized_termcolors=16
colorscheme solarized

if (&ft=='py' || &ft=='pyc')
" Atomatic removal of trailing whitespaces
    autocmd BufWritePre * :%s/\s\+$//e
endif

" Highlight redundant whitespaces
highlight RedundantWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match RedundantWhitespace /[^\t]\zs\t\+/
match ExtraWhitespace /\s\+$\| \+\ze\t/

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Ctrl+C to copy to system clipboard. Only works if you have gVim/vim compiled with clipboard
vmap <C-c> "+y

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Control+F12 to build a ctags database for current directory
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
