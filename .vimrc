"
"" jastronaut's .vimrc!!

" plugins are nice
execute pathogen#infect()
" color the things
colorscheme base16-eighties
set background=dark
let colorspace=256
" useful airline
set laststatus=2
let g:airline_right_sep = '▒'
let g:airline_left_sep = '▒'
let g:ycm_filetype_blacklist = {
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'text' : 1,
      \ 'tex' : 1,
      \}

" other useful things
filetype plugin indent on

syntax enable
set shiftwidth=4
set tabstop=4
set pastetoggle=<F2>

set number
set incsearch
set mouse=a

set noswapfile

set spelllang=en_us spell
set modeline
