"
".vimrc first try
"
"

syntax on

set noerrorbells
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set smartcase
set ignorecase
set backup
set undodir=/.vim/undodir
set undofile
set incsearch " searching shows results immediatlly
set wrap
set autowrite
set linebreak
set backupext=.bak 
set patchmode=.orig " take a copy of the original file 
set mouse=a " enable mouse
set belloff=all " disable bell for vim and gvim
set wildmode=longest,list,full
set wildmenu
set ruler " show curser position all the time


highlight ColorColumn ctermbg=0 guibg=lightgray

call plug#begin('~/.vim/plugged')

Plug 'ycm-core/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'tmsvg/pear-tree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yuttie/comfortable-motion.vim'

" check plug and install neccery pluging
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#end()

" allow rg to search root files
if executable('rg')
    let g:rg_derive_root='true'
endif


" Theme
colorscheme gruvbox
set bg=dark
let g:airline_theme='gruvbox' " enable airline theme

" map leader space
let mapleader = " " 

" use "ii" to be used instead of escap twice
imap ii <Esc><Esc>
vmap ii <Esc><Esc>

" ctrl+n to open a new window and split the screen verticaly and wait for file
" name
nmap <C-n> :vsp new <CR>:edit 
imap <C-n> iinv 

" use ctrl+n then h to split the window horizontally and wait for file name
nmap <C-n>h :sp new <CR>:edit 
imap <C-n>h iinh

" copy and paste
vnoremap <C-c> "+y
map <C-p> "+p
imap <C-p> ii"+pi

" undo and redo
imap <C-z> <C-o>u
nmap <C-z> u
imap <C-r> <C-o><C-r>

" save file with ctrl+s
nmap <C-s> :update<CR>
imap <C-s> ii:update<CR>

" ctrl+t open a new tab
nmap <C-t> :tabnew<CR>

" to move between tabs ctrl+arrow (left and right)
nmap <C-Right> :tabnext<CR>
imap <C-Right> ii:tabnext<CR>
nmap <C-Left> :tabprev<CR>
imap <C-Left> ii:tabprev<CR>

" use leader plus hjkl to move between open windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" leader plus b shows the files in the folders
nnoremap <leader>b :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" formating with F7
map <F7> gg=G<C-o><C-o>
imap <F7> iigg=G<C-o><C-o>

" leader+vimrc open vimrc file from anyfile
map <leader>vimrc :vsp new <CR>:edit $MYVIMRC<CR>

" zz to put screen in the middle while in insert mode
imap zz <C-o>zz

" autoload .vimrc when saved
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" enable smart tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" allow .rsia syntax highlighting
au BufNewFile,BufRead /*.rasi setf css
