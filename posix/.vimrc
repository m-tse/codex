set paste " set paste mode (paste code in insert without weird newlines/indents)
" autoindent is turned off because it interferes with paste mode
"set autoindent " newlines inherit indent of previous lines

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
