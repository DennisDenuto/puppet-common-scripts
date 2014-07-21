syntax on
filetype plugin indent on
execute pathogen#infect()
let g:solarized_termtrans = 1
colorscheme solarized
call togglebg#map("<F5>")

set hlsearch
" remap ctrl+l to un-highlight search results
noremap <silent> <c-l> :nohls<cr><c-l>

" y yanks into system clipboard
" p pastes from system clipboard
set clipboard=unnamed



" Tyro settings:
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set cindent
set ignorecase
set smartcase
set nowrap
set paste


" Shows a line indicating mode (ie, the -- INSERT -- at the bottom )
set showmode

" Show file position
set ruler

" Show incomplete commands in status bar.
set showcmd

" Show cursor line by default - makes it easier to pair
set cursorline

" Always show a status line
set laststatus=2

" Configure the status line
set statusline=%F%m%a%r%=\ %y\ \ \-\ %3.3v,%5.5l/%5.5L\ %%%3.3p

" line numbers on
set number
"
" next/previous search results always centered
nmap n nzz
nmap s-n s-nzz
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" incremental search
set incsearch
set hlsearch

map l 4zl " Scroll left
map h 4zh " Scroll right

let mapleader="\\"
map <Leader>h :set hls!<CR>
map <Leader>i :set ignorecase!<CR>
map <Leader>l :set number!<CR>
" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
map <Leader>c :set cursorline!<CR>

" one space after a period not two
set nojoinspaces

set lazyredraw

" we hate literal tabs tabs
highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\ /

" highlight extra spaces ftw
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * redraw!
