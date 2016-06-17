" Because I always forget
" <c-g> => ctrl+g

"##############################################################################
"#  Vundle https://github.com/VundleVim/Vundle.vim
"##############################################################################

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" ### Add plugins BELOW here

" Rainbow Pranthesis Improved
Plugin 'luochen1990/rainbow'

" vim-json better json highlighting
Plugin 'elzr/vim-json'

" Fugitive
" Plugin 'tpope/vim-fugitive'

" ### Add plugins ABOVE here
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Enable syntax highlighting
syntax enable
colorscheme desert
set background=dark
set showmatch

" Manual file type syntax setting
autocmd BufNewFile,BufRead *.html.twig   set syntax=html
autocmd BufNewFile,BufRead *.zsh*        set filetype=zsh
autocmd BufNewFile,BufRead *.json        set filetype=json

" Enable rainbow parens
let g:rainbow_active = 1

let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['160','208', '84', '163', '213', '192'],
    \   'operators': '_,\|+\|-\|*\|===\|!==_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold', 'start=/</ end=/>/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

" Highlight text past 80 columns
highlight OverLength ctermbg=017 guibg=#592929
match OverLength /\%81v.\+/

" Enable hardmode (aka fastmode)
" This is extra spicy - disables mouse too
map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>
imap <left>  <nop>
map  <right> <nop>
imap <right> <nop>

" Make these commonly mistyped commands still work
command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q

" Show highlighting groups for current word
" https://twitter.com/kylegferg/status/697546733602136065
nmap <c-g> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" qq to record, Q to replay
nnoremap Q @q

" Make time easy
:nnoremap <leader>t "=strftime("%F")<CR>P
:nnoremap <leader>d "=strftime("%F %T")<CR>P
:nnoremap <leader>h "=strftime("%r %x")<CR>P

" Tabs
set shiftwidth=2
set softtabstop=2
set tabstop=2
set shiftround
set expandtab

" EOLs
set noeol
set ffs=unix,mac,dos

" Code Folding
set foldmethod=marker
set foldmarker={{{,}}}

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Use :C to clear hlsearch
command! C nohlsearch

" Swapfiles
set directory=~/.vimswap

" Mapleader (space)
let mapleader = "\\"
let g:mapleader = "\\" 

" Fastmaps
nmap <leader><leader> :w!<cr>
nmap <cr><cr> :C<cr>

" Force write readonly files using sudo
command! WS w !sudo tee %

" Wildmenu
set wildmenu
set wildmode=list:longest,full

" Wrap
set whichwrap+=<,>,h,l

" Toggle
" http://ddrscott.github.io/blog/2016/vim-toggle-movement/
" Can use two ways 1. to give a command a first and second
" action (like 0) or 2. make an action toggle by pressing 
" same key over again
function! ToggleMovement(firstOp, thenOp)
  let pos = getpos('.')
  execute "normal! " . a:firstOp
  if pos == getpos('.')
    execute "normal! " . a:thenOp
  endif
endfunction

" 0 goes to first char then first column
nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>

" These toggle their respective actions
nnoremap <silent> ; :call ToggleMovement(';', ',')<CR>
nnoremap <silent> , :call ToggleMovement(',', ';')<CR>
nnoremap <silent> H :call ToggleMovement('H', 'L')<CR>
nnoremap <silent> L :call ToggleMovement('L', 'H')<CR>
nnoremap <silent> G :call ToggleMovement('G', 'gg')<CR>
nnoremap <silent> gg :call ToggleMovement('gg', 'G')<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
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


"##############################################################################
"#  Miscellaneous
"##############################################################################

" Force nice commit messages
autocmd Filetype gitcommit setl spell textwidth=80

" Automatically reload vimrc on save
autocmd! BufWritePost init.vim,vimrc.local,.vimrc so $MYVIMRC

" Toggle HTML escape works undre cursor or for whole highlight
" via: http://vim.wikia.com/wiki/HTML_entities
function! HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
endfunction

function! HtmlUnEscape()
  silent s/&lt;/</eg
  silent s/&gt;/>/eg
  silent s/&amp;/\&/eg
endfunction

map <silent> <Leader>he :call HtmlEscape()<CR>
map <silent> <Leader>hu :call HtmlUnEscape()<CR>
