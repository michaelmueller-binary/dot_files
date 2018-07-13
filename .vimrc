set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"vundle managed packages
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'w0rp/ale'
call vundle#end()

"set the tab stop defaults
"set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

setlocal spell spelllang=en_us

" NetRW remove Banner
let g:netrw_banner = 0

"allow you to move buffers with out having to save them each time.
 set hidden
    set statusline+=%#warningmsg#
    set statusline+=%*
    set laststatus=2
    syn on
    :set mouse=a
    "stop vim jumping back a character when hitting escape.
    "inoremap <silent> <Esc> <Esc>`^
    colorscheme desert
    "sn v mode ident code
    vmap <tab> >gv
    vmap <s-tab> <gv
    set background=dark
    " make tab in normal mode ident code
    nmap <tab> I<tab><esc>
    nmap <s-tab> ^i<bs><esc>
    filetype plugin indent on
    "Ignore Case in Search
    set ignorecase
    "smartcase will do case sensitive if mixed charcters used
    set smartcase
   "use nore regexs for vim not voms crazy ones
    nnoremap / /\v
    vnoremap / /\v
    "show matches incremently
    set incsearch
    autocmd FileType netrw nnoremap ? :help netrw-quickmap<CR>
    "remap esc to jj
    inoremap jj <ESC>
    "persisnent undo files
    set undodir=~/vimundo
    set undofile
    let mapleader = ","
    nnoremap <leader>a :Ack

    let g:ale_linters = { 'perl': ['perl','perlcritic'] }
