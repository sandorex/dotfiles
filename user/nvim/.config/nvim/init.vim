
call plug#begin('~/.vim-plug')

Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'

call plug#end()

syntax on

" theming
set background=dark
colorscheme onedark
set termguicolors

" configuration
set autoindent " keep indentation when making a new line
set nosmarttab
set incsearch " highlight searches while typing
set ruler " show column, line num
set wildmenu " cmd autocompletion on tab
set scrolloff=6 " keep 2 lines above/below cursor
set sidescrolloff=6 " keep 2 characters left/right of the cursor
set display+=lastline " remove @ when line doesnt fit
set autoread " reread file when changed
" set nowrap " disable word wrap
set cursorline " highlight line the cursor is on
set nobackup " no backup files
set noswapfile " no swap files
set hidden " allows hidden buffers
set number " show line number
set title " set title to show its vim

" indentation
" set noexpandtab
set tabstop=3
set softtabstop=3

" mapping
noremap ; :

" exit search by pressing enter
nnoremap <CR> :noh<CR><CR>

" TODO map space to Ctrl V (aka select)

" -- hooks --
" alert when file changes
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
