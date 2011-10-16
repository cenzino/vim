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
set mouse=a

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
set hidden

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
	set guifont=Monaco\ 10 " Font
    let g:solarized_contrast="high"    "default value is normal
    let g:solarized_visibility="high"    "default value is normal
    set background=dark
    colorscheme solarized
else
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
    "colorscheme solarized
    set background=dark
    "colorscheme molokai 
    colorscheme mustang2
    "set background=dark
endif

" =================================
" Plugin
" =================================

" CommandT
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

" NERDTree
map <F2> :NERDTreeToggle<CR>

" MiniBufExpl
" let g:miniBufExplMapWindowNavVim = 1 
"let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplMapCTabSwitchBufs = 1 
"let g:miniBufExplModSelTarget = 1 

" TagBar
let g:tagbar_usearrows = 1
nnoremap <leader>i :TagbarToggle<CR>

""""""""""""""""""""""
set ofu=syntaxcomplete#Complete

" SuperTab
let g:SuperTabDefaultCompletionType = "context"

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loclist=1
let g:syntastic_quiet_warnings=0

" LustyJuggler
nmap <silent> <Leader>b :LustyJuggler<CR>

" Sparkup
let g:sparkupNextMapping = '<c-x>'

" =================================
" Settings linguaggi
" =================================

" Markdown
autocmd BufNewFile,BufRead *.txt,*.markdown,*.md setlocal ft=mkd

" Django
autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate


" ---------------------------------------------------------------------

set completeopt=longest,menuone
" inoremap <Nul> <C-x><C-o>

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
