set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"vundle managed packages
Plugin 'code4pay/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'w0rp/ale'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ap/vim-buftabline'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
call vundle#end()

"CtrlP wont change working dir easier for finding files across all projects. 
let g:ctrlp_working_path_mode = 0

"set the tab stop defaults
"set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set spell spelllang=en_us

" NetRW remove Banner
let g:netrw_banner = 0

"allow you to move buffers with out having to save them each time.
 set hidden

    set nu
    syn on
    :set mouse=a
    "stop vim jumping back a character when hitting escape.
    "inoremap <silent> <Esc> <Esc>`^
    colorscheme code4pay
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
    "remap esc to jj
    inoremap jj <ESC>
    set backupdir=~/vimundo
    "persisnent undo files
    set undodir=~/vimundo
    set undofile
    let mapleader = ","
    nnoremap <leader>a :Ack! <SPACE>
    nnoremap <leader>p :!perldoc % <ENTER>

    set tag=/home/git/tags

    "ale perl checking
    let g:ale_perl_perlcritic_profile = "/home/git/regentmarkets/cpan/rc/.perlcriticrc"
    let g:ale_perl_perltidy_profile = "/home/git/regentmarkets/cpan/rc/.perltidyrc"
    let g:ale_linters = { 'perl': ['perl','perlcritic','perltidy'] }
    let g:ale_fixers = { 'perl':['perltidy'] }
    
    "status line
    set laststatus=2
    set statusline+=%#warningmsg#
    set statusline+=%#LineNr#
    set statusline+=%f%=%{FugitiveStatusline()}   
    
    "kill buffers with out closing windows
     command Bd b#|bd#
     
    "word completion
    inoremap <LEADER>c <C-x><C-p>
    "open file browser at different locations
    nnoremap <F2> :Ex<CR> 
    nnoremap <F3> :Ex /home/git/regentmarkets<CR>
    "buffer movment (used with Autohotkey and buftabs)
    nnoremap <F7> :bp<CR> 
    nnoremap <F8> :bn<CR>  
    tnoremap <F7> <C-W>:bp<CR>
    tnoremap <F8> <C-W>:bn<CR>
     
    "easier window movement
    nnoremap <C-l> <C-W>l
    tnoremap <C-l> <C-W>l
    nnoremap <C-k> <C-W>k
    nnoremap <C-h> <C-W>h
    nnoremap <C-j> <C-W>j
    
    nnoremap <F5> :checktime<CR>

" change local dir to the repos dir
"
function! ChangeBaseDir()
    cd /home/git/regentmarkets
    let dirarray = split(expand('%:.'),'/')
    let dir = dirarray[0]
    exec "lcd ". dir
endfunction

