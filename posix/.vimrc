" Paste and autoindent are mutually exclusive.
" Just disable autoindent, it drives me crazy.
set paste " set paste mode (paste code in insert without weird newlines/indents)
set noautoindent
filetype indent off
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command Wq :execute ':silent w !sudo tee % > /dev/null' | :edit! | :quit

set tabstop=2 " indent using 2 spaces
set smarttab " Insert tab stop number of spaces when Tab is pressed
set expandtab " convert tabs to spaces

set cursorline " Show a horizontal line where the cursor is across the screen
set showmatch " Automatically highlight the matching brace, paren, bracket, etc.
set ruler " Display the current row, column, and % of document on bottom right
set scrolloff=10 " When scrolling up/down, maintain a buffer so we don't scroll at the end.

set hlsearch " Enable search highlighting
set incsearch " Incremental search that shows partial matches
set ignorecase " Ignore case when searching
set smartcase " Automatically switch search to case-sensitive when search query contains an upper letter

set autoread " Automatically re-read files if unmodified in vim
set noswapfile " Disable swap files.

syntax enable " syntax highlighting
set background=dark
set notermguicolors " Use terminal colors
highlight Statement ctermfg=11 " Bold Yellow for statements (for, while if)
highlight Comment ctermfg=14 " Cyan comments
highlight Identifier ctermfg=4 " Blue identifiers
highlight Constant ctermfg=3 " Yellow constants
highlight Type ctermfg=2 " green types
highlight PreProc ctermfg=5 " Purple
highlight Special ctermfg=4 " Blue
highlight Title ctermfg=4 " Blue
