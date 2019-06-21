"
"" jastronaut's .vimrc!!
"

" plugins are nice
execute pathogen#infect()

" color the things
set background=dark
syntax enable
" colorscheme base16-ocean
let colorspace=256

" useful airline
set laststatus=2
" let g:airline_powerline_fonts = 1
" let g:airline_theme='base16_ocean'
let g:airline_right_sep = '░▒▓'
let g:airline_left_sep = '▓▒░'
let g:ycm_filetype_blacklist = {
	\ 'notes' : 1,
	\ 'markdown' : 1,
	\ 'text' : 1,
	\ 'tex' : 1,
	\ 'html' : 1,
	\}

let g:UltiSnipsExpandTrigger="<C-w>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snip"]
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-e> :NERDTreeToggle<CR>

" other useful things
filetype plugin indent on
set noexpandtab
set autoindent
set tabstop=4
set shiftwidth=4
set pastetoggle=<F2>
set number
set incsearch
set smartcase
set hlsearch
set mouse=a
set noswapfile
set modeline

nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

autocmd BufWritePre * :%s/\s\+$//e
hi Normal ctermbg=none

" nmap <C-tab> :tabnext<cr>
" imap <C-tab> <ESC>:tabnext<cr>i
imap jj <Esc>

if has("autocmd")
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line ("'\"") <= line("$") |
		\   exe "normal! g'\"" |
		\ endif
endif

" nerd commenter settings

filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" js stuff

let g:javascript_conceal_arrow_function = "⇒"
set conceallevel=1
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

" stuff for ale

let g:ale_sign_error = '↳'
let g:ale_sign_warning = '↪'
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
\	'python': ['flake8'],
\}
