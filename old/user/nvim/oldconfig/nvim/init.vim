call plug#begin('~/.vim-plug')

" theming
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
"Plug 'junegunn/rainbow_parentheses.vim'

" syntax / language completion
Plug 'sheerun/vim-polyglot'

" other
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'

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
set noexpandtab
set tabstop=3
set softtabstop=3

" commands
command! Init :edit ~/.config/nvim/init.vim

command! Tterm :tabnew	| :set nonumber	| :startinsert	| :terminal
command! Hterm :split	| :set nonumber	| :startinsert	| :terminal
command! Vterm :vsplit	| :set nonumber	| :startinsert	| :terminal

" key mapping
noremap ; :

" exit terminal mode by pressing Escape
tnoremap <Esc> <C-\><C-n>

" go thru tabs
map <C-Right> :tabnext<CR>
map <C-Left> :tabprevious<CR>
tmap <C-Right> <ESC>:tabnext<CR>
tmap <C-Left> <ESC>:tabprevious<CR>
tnoremap <M-Right> <C-Right>
tnoremap <M-Left> <C-Left>

" change redo
noremap U <c-r>
noremap <c-r> <NOP>

" open nerdtree
map <C-b> :NERDTreeToggle<CR>

" quit nerd tree on file open
let g:NERDTreeQuitOnOpen = 1

" show nerd tree always on the right instead on the left
let g:NERDTreeWinPos = "right"

" enter insert mode when entering terminal buffer
autocmd BufEnter term://* startinsert

" alert user if file changes
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" open nerdtree if no files are open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

