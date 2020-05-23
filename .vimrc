"
".vimrc first try
"

syntax on

set noerrorbells
set hidden
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set smartcase
set ignorecase
set undodir=/.vim/undodir
set undofile
set incsearch " searching shows results immediatlly
set wrap
set autowrite
set linebreak
set nobackup
set mouse=nv " enable mouse only in normal and visual mode
set belloff=all " disable bell for vim and gvim
set wildmode=longest,list,full
set wildmenu
set ruler " show curser position all the time
set whichwrap+=<,>,[,]
set spelllang=en_us
set backspace=indent,eol,start
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*



" this for vimwiki
set nocompatible
filetype plugin on
syntax on

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
Plug 'vimwiki/vimwiki'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ap/vim-css-color'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'WolfgangMehner/c-support'
Plug 'vim-syntastic/syntastic'
Plug 'kien/ctrlp.vim'

" check plug and install neccery pluging
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#end()

" indentation line uses color scheme
let g:indentLine_setColors = 0

" each indent line has a distinct character
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" guard for distributions lacking the 'persistent_undo' feature.
if has('persistent_undo')
    " define a path to store persistent undo files.
    let target_path = expand('~/.vim/undodir/')    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif    " point Vim to the defined undo directory.
    let &undodir = target_path    " finally, enable undo persistence.
    set undofile
endif

" setting for syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_checkers = ['clang_tidy', 'gcc', 'make']
" clang_check clang_tidy gcc make
"let g:syntastic_<filetype>_checkers = ['<checker-name>']


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
inoremap ii <Esc><Esc>
vnoremap ii <Esc><Esc>

" ctrl+n to open a new window and split the screen verticaly and wait for file
" name
nnoremap <C-n> :vsp new <CR>:edit 
inoremap <C-n> <Esc><Esc>:vsp new <CR>:edit

" use ctrl+n then h to split the window horizontally and wait for file name
nnoremap <C-n>h :sp new <CR>:edit 
inoremap <C-n>h <Esc><Esc>:sp h<CR>:edit

" copy and paste
vnoremap <C-c> "+y
noremap <C-p> "+p
inoremap <C-p> <Esc><Esc>"+pa

" change the ctrlP plugint shortcut

" undo and redo
inoremap <C-z> <C-o>u
nnoremap <C-z> u
inoremap <C-r> <C-o><C-r>

" save file with ctrl+s
noremap <C-s> :update<CR>
inoremap <C-s> <Esc><Esc>:update<CR>

" ctrl+t open a new tab
nnoremap <C-t> :tabnew<CR>

" to move between tabs ctrl+arrow (left and right)

" and now map them
nnoremap <C-Right> :tabnext<CR>
inoremap <C-Right> <Esc><Esc>:tabnext<CR>
nnoremap <C-Left> :tabprev<CR>
inoremap <C-Left> <Esc><Esc>:tabprev<CR>


" use leader plus hjkl to move between open windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" leader plus b shows the files in the folders
nnoremap <leader>b :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" formating with F7
nnoremap <F7> gg=G
inoremap <F7> <Esc><Esc>gg=G'.i

" leader+vimrc open vimrc file from anyfile
map <leader>vimrc :vsp new <CR>:edit $MYVIMRC<CR>

" zz to put screen in the middle while in insert mode
inoremap zz <C-o>zz

" map leader+u to undotree
nnoremap <leader>u :UndotreeShow<CR>

" TODO: map arrows and up and down to move logical lines
" map j and k to go up logical lines
" nmap <Up> gk
" nmap k gk
" nmap <Up> <C-O>gk
" nmap k <C-O>gk
" nmap <Down> gj
" nmap j gj
" nmap <Down> <C-O>gj
" nmap j <C-O>gj

" use this to use tabularize
vnoremap <leader>t :Tab /

" autoload .vimrc when saved
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" enable smart tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" allow .rsia syntax highlighting
au BufNewFile,BufRead /*.rasi setf css


" intgrate ranger to vim with leader+x
function RangerExplorer()
    exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
    if filereadable('/tmp/vim_ranger_current_file')
        exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
        call system('rm /tmp/vim_ranger_current_file')
    endif
    redraw!
endfun
map <Leader>x :call RangerExplorer()<CR>


" leader + n for new note
nnoremap <leader>n :call NewEntry()<cr>
function! NewEntry()
    let title = expand('~/notes/') . strftime('%F') . '-' . input("Title: ")
    execute 'edit ' . title
endfunction


" save in the note directory with the date and time of the note using
" ctrl+alt+s
function! SaveWithTS(filename) range
    let l:extension = '.' . fnamemodify( a:filename, ':e' )
    if len(l:extension) == 1
        let l:extension = '.txt'
    endif

    let l:filename = escape ( fnamemodify(a:filename, ':r') . strftime(" - %Y-%m-%d_%H-%M") . l:extension, ' ' )

    execute "write /home/yasser/notes/" . l:filename
endfunction

command! -nargs=1 SWT call SaveWithTS( <q-args> )

" and now give it a shortcut ctrl+alt+s
set <F13>=
nnoremap <F13> :SWT 
inoremap <F13> <C-o>:SWT 
vnoremap <F13> <Esc><Esc>:SWT 

" enabling mark down for vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
            \ 'syntax': 'markdown', 'ext': '.md'}]

if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <M-[> <Esc>
    tnoremap <C-v><Esc> <Esc>
    nnoremap <leader>p :CtrlP<CR>
endif

" map f6 to spell check
map <F6> :setlocal spell! spelllang=en_us<CR>
