" Arnsteins nvim init file

let installPlug=1
let plug_file=expand('~/.local/share/nvim/site/autoload/plug.vim')
if !filereadable(plug_file)
    echo "Installing plugin manager"
    !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let installPlug=0
    echo "Done installing plugin manager!"
endif

call plug#begin()
Plug 'arnstein/yoctolog.vim' "Yocto log syntax

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'altercation/vim-colors-solarized' "Colorscheme
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'


if installPlug == 0
    echo "Installing plugins, please ignore key map error messages"
    :PlugInstall
endif
call plug#end()

lua require('lualine').setup({options = {theme = 'solarized_dark'}})

" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Highlight search results and remove the highlight when pressing enter
set hlsearch
nnoremap <CR> :noh<CR><CR>

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.local/share/nvim/backups > /dev/null 2>&1
set undodir=~/.local/share/nvim/backups
set undofile

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Proper tab indent
set tabstop=4
set shiftwidth=4
set expandtab


" Make it look good
syntax enable
set background=dark
let g:solarized_termcolors=16
colorscheme solarized

" Enable line numbers
set number
