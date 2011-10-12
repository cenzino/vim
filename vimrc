"
" Configurazione personale di Vim
"
" *********************************************** 

" Pathogen
call pathogen#infect()

" ===============================================
" Basic 
" ===============================================
set nocompatible
syntax on

filetype plugin on
filetype indent on

" ==================================
" Generale
" ==================================
let mapleader = ","
let g:mapleader = ","

" Salvataggio veloce
nmap <leader>w :w!<cr>

" Apertura veloce di .vimrc
map <leader>e :e! ~/.vimrc<cr>

" Dopo il salvataggio di .vimrc viene caricato
autocmd! bufwritepost .vimrc source ~/.vimrc

" ====================
" File e backups
" ====================
set nobackup
set nowb
set noswapfile

" ======================================
" Interfaccia
" ======================================
set ruler
set number
set modeline
set so=7
set backspace=eol,start,indent
set whichwrap+=h,l,<,>,[,]
set showcmd                         " Mostra i commandi durante la pressione
set showmatch                       " Evidenzia la parentesi corrispondente
set showmode

" Remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Disable the stupid pydoc preview window for the omni completion
set completeopt-=preview

" Disable the blinking cursor.
set gcr=a:blinkon0

set ttyfast

" Ricerca
set ignorecase
set smartcase
set hlsearch
set incsearch

set magic

" Wildmenu
set wildmenu
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc
set wildmode=list:longest " turn on wild mode huge list

" Formattazione testo
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=8
set smarttab

set autoindent
set smartindent
set wrap

" Make the command line two lines high and change the statusline display to
" something that looks useful.
set cmdheight=2
set laststatus=2
"set statusline=[%l,%v\ %P%M][CWD:\ %{CWD()}][FILE:\ %f]\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}\ 

function! CWD()
    let curdir = substitute(getcwd(), '/home/mnazim', "~/", "g")
    return curdir
endfunction

" =================================
" Folding
" =================================
set foldenable                                          " Turn on folding
set foldmarker={,}                                      " Fold C style code (only use this as default if you use a high foldlevel)
set foldmethod=marker                                   " Fold on the marker
set foldlevel=100                                       " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag        " what movements open folds 
"function SimpleFoldText()
"    return getline(v:foldstart).' '
"endfunction
"set foldtext=SimpleFoldText()                          " Custom fold text function (cleaner than default)

" =================================
" GUI
" =================================
set t_Co=256

if has("gui_running")
	set guioptions-=T
	set guifont=Consolas\ 10 " Font
    "set background=dark
    "colorscheme desert    
    let g:solarized_contrast="high"    "default value is normal
    let g:solarized_visibility="high"    "default value is normal
    set background=dark
    colorscheme solarized

    " let g:solarized_termtrans=0
    " let g:solarized_termcolors=16
else
    "set background=dark
    "colorscheme solarized
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
    set background=dark
    colorscheme solarized
endif

" =================================
" Plugin
" =================================

" CommandT
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

" =================================
" Settings linguaggi
" =================================

" Markdown
autocmd BufNewFile,BufRead *.txt,*.markdown,*.md setlocal ft=mkd

" NERDTree
map <F2> :NERDTreeToggle<CR>
