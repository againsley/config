"Enable syntax highlighting
syntax enable
colorscheme desert
set background=dark
set showmatch

"Manual file type syntax setting
autocmd BufNewFile,BufRead *.html.twig   set syntax=html
autocmd BufNewFile,BufRead *.zsh*        set filetype=zsh

"Tabs
set shiftwidth=2
set softtabstop=2
set tabstop=2
set shiftround
set expandtab

"EOLs
set noeol
set ffs=unix,mac,dos

"Code Folding
set foldmethod=marker
set foldmarker={{{,}}}

"Search
set ignorecase
set smartcase
set hlsearch
set incsearch

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

"##############################################################################
"#  Status Line
"##############################################################################

" Always on
set laststatus=2

" Track current mode for dynamic highlighting
let g:currentmode={
    \ 'n'  : 'N ',
    \ 'no' : 'N·Operator Pending ',
    \ 'v'  : 'V ',
    \ 'V'  : 'V·Line ',
    \ '^V' : 'V·Block ',
    \ 's'  : 'Select ',
    \ 'S'  : 'S·Line ',
    \ '^S' : 'S·Block ',
    \ 'i'  : 'I ',
    \ 'R'  : 'R ',
    \ 'Rv' : 'V·Replace ',
    \ 'c'  : 'Command ',
    \ 'cv' : 'Vim Ex ',
    \ 'ce' : 'Ex ',
    \ 'r'  : 'Prompt ',
    \ 'rm' : 'More ',
    \ 'r?' : 'Confirm ',
    \ '!'  : 'Shell ',
    \ 't'  : 'Terminal '
    \}

" Automatically change the statusline highlight depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=008'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermfg=005'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermfg=004'
  else
    exe 'hi! StatusLine ctermfg=006'
  endif

  return ''
endfunction

" Get current buffer size and output
function! FileSize()
    let bytes = getfsize(expand('%:p'))
    if (bytes >= 1024)
        let kbytes = bytes / 1024
    endif
    if (exists('kbytes') && kbytes >= 1000)
        let mbytes = kbytes / 1000
    endif

    if bytes <= 0
        return '0'
    endif

    if (exists('mbytes'))
        return mbytes . 'MB '
    elseif (exists('kbytes'))
        return kbytes . 'KB '
    else
        return bytes . 'B '
    endif
endfunction

" Check if readonly
function! ReadOnly()
  if &readonly || !&modifiable
    return 'readonly'
  else
    return ''
endfunction

" Autobots rollout
set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%8*\ [%n]                                " buffernr
set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%9*\ %=                                  " Space
set statusline+=%8*\ %y\                                 " FileType
set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
set statusline+=%0*\ %3p%%\ %l/%L\%3c\                 " Rownumber/total (%)

" Set default
hi User1 ctermfg=015
hi User2 ctermfg=015
hi User3 ctermfg=015
hi User4 ctermfg=015
hi User5 ctermfg=015
hi User7 ctermfg=015
hi User8 ctermfg=015
hi User9 ctermfg=015

autocmd Filetype gitcommit setl spell textwidth=80
