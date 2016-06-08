"Enable syntax highlighting
syntax enable
colorscheme desert
set background=dark
set showmatch

"Manual file type syntax setting
autocmd BufNewFile,BufRead *.html.twig   set syntax=html


"Tabs
set shiftwidth=2
set softtabstop=2
set tabstop=2
set shiftround
set expandtab

"EOLs
set noeol
set ffs=unix,mac,dos

"HUD
set ruler
set laststatus=2
set scrolloff=5

"Code Folding
set foldmethod=marker
set foldmarker={{{,}}}

"Search
set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <esc> :noh<return><esc>

"Swapfiles
set directory=~/.vimswap

"Mapleader (space)
let mapleader = " " 
let g:mapleader = " " 

"Fastmaps
nmap <leader><leader> :w!<cr>

"Wildmenu
set wildmenu
set wildmode=list:longest,full

"Wrap
set whichwrap+=<,>,h,l

"Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Close the current buffer
map <leader>bd :Bclose<cr>

"Close all the buffers
map <leader>ba :1,1000 bd!<cr>

"Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>tj :tabn<cr>
map <leader>tk :tabp<cr>

"Return to last edit position when opening file
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Pressing <space>ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
