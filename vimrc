"
" Configurazione personale di Vim
"
" *********************************************** 

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
if has("gui_running")
	set guioptions-=T
	"set t_Co=256
	set guifont=Consolas\ 10 " Font
    set background=dark
    colorscheme desert    
endif

" =================================
" Plugin
" =================================


" =================================
" Settings linguaggi
" =================================
