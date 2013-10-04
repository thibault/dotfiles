source ~/.vim/.vimrc.bepo

" Basic configuration
"""""""""""""""""""""
" Let's vim, bitch!
set nocompatible
syntax on

" Move backup files out of the working directory
set backupdir=/tmp
set directory=/tmp

" Indentation settings
set expandtab  " Replace tabs with spaces
set tabstop=4  " Number of spaces in a tab
set shiftwidth=4  " Indent size
set softtabstop=4
set smarttab
set autoindent

" Navigation settings
set scrolloff=5  " Don't let the cursor go to the top / bottom of screen

" Search settings
set hlsearch  " Highlight search patterns
set incsearch  " Search as we type
set ignorecase
set smartcase

" Formatting configuration
""""""""""""""""""""""""""
set encoding=utf-8
set fileencoding=utf8
set nowrap
set linebreak
set colorcolumn=80
set guifont=Monospace\ 10
if ! has("gui_running")
    se background=dark
endif
" Higlight nbsp
highlight NbSp ctermbg=lightgray guibg=lightred
match NbSp /\%xa0/

" Remaps
""""""""
noremap è :w

" Use ,e to edit files in same directory
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>

" Autocommands
""""""""""""""
" Deal with this shitty windows project
autocmd BufNewFile,BufRead /home/thibault/code/spm/* set ff=dos

" Reload vim configuration on .vimrc edition
autocmd! bufwritepost .vimrc source ~/.vimrc

" Remove trailing spaces on buffer write
autocmd BufWrite * silent! %s/[\r \t]\+$//


" Custom plugins configuration
""""""""""""""""""""""""""""""

" Activate the Vundle plugin manager
source ~/.vim/.vimrc.vundle

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E501'

" Activate sparkup for other filetypes
augroup sparkup_types
    autocmd!
  autocmd FileType mustache,php,htmldjango runtime! ftplugin/html/sparkup.vim
augroup END

colorscheme solarized
