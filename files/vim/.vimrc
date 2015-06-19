set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'ekalinin/Dockerfile.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/JavaDecompiler.vim'
Plugin 'elzr/vim-json'
Plugin 'rodjek/vim-puppet'
Plugin 'thoughtbot/vim-rspec'
Plugin 'derekwyatt/vim-scala'
Plugin 'othree/xml.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


syntax on
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
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



"-----------------------------------------------------------------------------
" CtrlP Settings
"-----------------------------------------------------------------------------
let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_tabpage_position = 'c'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_root_markers = ['.project.root']
let g:ctrlp_custom_ignore = '\v%(/\.%(git|hg|svn)|\.%(class|o|png|jpg|jpeg|bmp|tar|jar|tgz|deb|zip)$|/target/%(quickfix|resolution-cache|streams)|/target/scala-2.10/%(classes|test-classes|sbt-0.13|cache)|/project/target|/project/project)'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = '1ri'
let g:ctrlp_match_window = 'max:40'
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-n>'],
  \ 'PrtSelectMove("k")':   ['<c-p>'],
  \ 'PrtHistory(-1)':       ['<c-j>', '<down>'],
  \ 'PrtHistory(1)':        ['<c-i>', '<up>']
\ }
nmap ,fb :CtrlPBuffer<cr>
nmap ,ff :CtrlP .<cr>
nmap ,fF :execute ":CtrlP " . expand('%:p:h')<cr>
nmap ,fr :CtrlP<cr>
nmap ,fm :CtrlPMixed<cr>


"-----------------------------------------------------------------------------
" NERDTree Settings
"-----------------------------------------------------------------------------
"Open NERDTree by default if no files are open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"mapping to ctrl n
map <C-n> :NERDTreeToggle<CR>

"-----------------------------------------------------------------------------
" XPTemplate settings
"-----------------------------------------------------------------------------
let g:xptemplate_brace_complete = ''

"-----------------------------------------------------------------------------
" rspec Settings
"-----------------------------------------------------------------------------
let g:rspec_command = "!bundle exec rspec --drb {spec}"
map <Leader>r :call RunCurrentSpecFile()<CR>
let g:rspec_runner = "os_x_iterm"
"""""""""""""""""""""""
"  Make youcompleteme compatible with UltiSniper (using supertab)  "
"""""""""""""""""""""""
"
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"""""""""""""""""""""""
"  ultisnip Settings  "
"""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
set nopaste
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
