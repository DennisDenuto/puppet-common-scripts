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

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
