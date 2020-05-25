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
set nowritebackup
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
set cmdheight=2
set updatetime=300
set shortmess+=c

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" this for vimwiki
set nocompatible
filetype plugin on
syntax on

highlight ColorColumn ctermbg=0 guibg=lightgray

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
"Plug 'tpope/vim-fugitive'
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
