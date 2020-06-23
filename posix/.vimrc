" Paste and autoindent are mutually exclusive.
" Here we choose to have paste on by default, with the F8
" command turning on autoindent (and disabling paste mode)
set paste " set paste mode (paste code in insert without weird newlines/indents)
:noremap <F8> :set autoindent<CR>
" Here is the commented out of alternate commands where autoindent is enabled by default, and paste is <F8>
" set autoindent
" set pastetoggle=<F8>

set tabstop=2 " indent using 2 spaces
set smarttab " Insert tab stop number of spaces when Tab is pressed
set expandtab " convert tabs to spaces
filetype indent on " Enable indent rules that are file specific

syntax enable " syntax highlighting
set cursorline " Show a horizontal line where the cursor is across the screen
set showmatch " Automatically highlight the matching brace, paren, bracket, etc.
set ruler " Display the current row, column, and % of document on bottom right

set hlsearch " Enable search highlighting
set incsearch " Incremental search that shows partial matches
set ignorecase " Ignore case when searching
set smartcase " Automatically switch search to case-sensitive when search query contains an upper letter

" A nice default color scheme that looks close to the homebrew terminal colors
" colorscheme murphy

set autoread " Automatically re-read files if unmodified in vim
set noswapfile " Disable swap files.
