source ~/.vim/.vimrc.bepo

" Custom plugins configuration
""""""""""""""""""""""""""""""

" Activate the Vundle plugin manager
source ~/.vim/.vimrc.vundle

" Colorscheme configuration
colorscheme molokai
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E501'
let g:syntastic_javascript_checkers = ['jshint']
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
imap <C-Tab> <Plug>delimitMateS-Tab
imap <C-B> ·e·

" Activate sparkup for other filetypes
augroup sparkup_types
    autocmd!
    autocmd FileType mustache,php,htmldjango runtime! ftplugin/html/sparkup.vim
augroup END

" Basic configuration
"""""""""""""""""""""
" Let's vim, bitch!
set nocompatible
syntax on
set ruler " display info on cursor position
set nomousehide  " Fix invisble cursor bug
set cursorline   " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set noshowmatch  " don't highlight matching brackets

" Move backup files out of the working directory
set backupdir=/tmp
set directory=/tmp

" Indentation settings
set expandtab  " Replace tabs with spaces
set tabstop=4  " Number of spaces in a tab
set shiftwidth=4  " Indent size
set softtabstop=4
set smarttab  " Use shiftwidths at left margin, tabstops everywhere else
set autoindent

" Navigation settings
set scrolloff=5  " Don't let the cursor go to the top / bottom of screen

" Search settings
set hlsearch  " Highlight search patterns
set incsearch  " Search as we type
set ignorecase
set smartcase
" Use backspace to cancel search highlighting
nmap <silent> <BS> :nohlsearch <CR>

" Formatting configuration
""""""""""""""""""""""""""
set encoding=utf-8
set fileencoding=utf-8
set nowrap
set linebreak
set colorcolumn=80
set guifont=Monospace\ 11
if ! has("gui_running")
    se background=dark
endif
" Higlight nbsp
exec "set listchars=trail:▓,nbsp:▓,tab:»·"
set list

" Gui options, remove toolbars and unnecessary widgets
set guioptions-=r  " no scrollbar on the right
set guioptions-=R  " no scrollbar on the right
set guioptions-=l  " no scrollbar on the left
set guioptions-=m  " no menu
set guioptions-=T  " no toolbar
set guioptions-=b

" Remaps
""""""""
noremap è :w
" Use ,e to edit files in same directory
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
noremap Q {V}gq
noremap J ggVG"+y

" Autocommands
""""""""""""""
" Reload vim configuration on .vimrc edition
autocmd! bufwritepost .vimrc source ~/.vimrc

" Remove trailing spaces on buffer write
autocmd BufWrite * silent! %s/[\r \t]\+$//

" All *md files are markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
