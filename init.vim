" ~/.config/nvim/init.vim
syntax on

" settings

set gdefault
set hidden
set ignorecase
set lazyredraw
set nostartofline
set showcmd

set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,eol:¶
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set wildmode=longest,full

set statusline=
set statusline+=%f
set statusline+=%(\ [%{fugitive#head()}%Y%R%W%M]%)
set statusline+=%=
set statusline+=[%(%l,%c%V%)]
set statusline+=\ %P

if has("persistent_undo")
    set swapfile directory=~/.vimtemp/swap//
    set backup backupdir=~/.vimtemp/backup//
    set undofile undodir=~/.vimtemp/undo//
endif

" mappings
nnoremap Y y$
nnoremap Q @q
nnoremap gV `[v`]
nnoremap <Leader>a <c-^>

nnoremap <silent> <leader>gi :GoImports<CR>
" go test in right pane
nnoremap <silent> <leader>gt :w<CR>:call tbone#send_keys('right', "<C-V><C-C><C-V><C-L>got<C-V><CR>")<CR>
" rerun previous command in right pane
nnoremap <silent> <leader>tp :w<CR>:call tbone#send_keys('right', "<C-V><C-C><C-V><C-L><C-V><C-P><C-V><CR>")<CR>

" change current word and prepare to repeat next occurence (like *cgn)
nnoremap c* :<C-U>let @/='\<'.expand("<cword>").'\>'<CR>:set hlsearch<CR>cgn

cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-p> <up>
cnoremap <c-n> <down>

tnoremap <Esc> <C-\><C-n>
" tnoremap <A-h> <C-\><C-n><C-w>h
" tnoremap <A-j> <C-\><C-n><C-w>j
" tnoremap <A-k> <C-\><C-n><C-w>k
" tnoremap <A-l> <C-\><C-n><C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l

onoremap ae :<C-U>normal! ggVG<CR>
xnoremap ae :<C-U>normal! ggVG<CR>

" autocommands
if has("autocmd")
    augroup autocommands
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
    augroup END
endif


" plugins and plugin settings
call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/linediff.vim'
Plug 'AndrewRadev/writable_search.vim'
Plug 'airblade/vim-gitgutter'
Plug 'bruno-/vim-vertical-move'
Plug 'coderifous/textobj-word-column.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'idbrii/vim-mark'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mbbill/undotree'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tommcdo/vim-exchange'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/ScrollColors'

" colorscheems
Plug 'chriskempson/base16-vim'
Plug 'sts10/vim-mustard'

Plug '~/code/nvim-editcommand'
let g:editcommand_prompt = ':'

Plug 'rking/ag.vim'
let g:ag_highlight = 1

Plug 'fatih/vim-go'
let g:go_highlight_methods = 1
let g:go_highlight_trailing_whitespace_error = 0

Plug 'bronson/vim-visual-star-search' " must be after vim-mark because of mapping clash? check and fix!

" local plugins
Plug '~/.vim/bundle/targets.vim'
let g:targets_addJumplist = 1
let g:targets_jumpRanges = 'rr rb rB bb bB BB ll al Al aa Aa AA'
Plug '~/.vim/bundle/tmux-complete.vim' " deoplete completion makes deoplete slow :(
Plug '~/.vim/bundle/visual-split.vim'
let g:tmuxcomplete#trigger = ''

" for testing
" for https://github.com/wellle/tmux-complete.vim/issues/67
" Plug 'Shougo/deoplete.nvim'
" let g:deoplete#enable_at_startup = 1
" Plug 'zchee/deoplete-go', { 'do': 'make'}
" check code of this plugin: https://github.com/Shougo/neco-syntax
" Plug 'Shougo/neco-syntax'
" Plug 'Shougo/neocomplcache.vim'
" let g:neocomplcache_enable_at_startup = 1

" Add plugins to &runtimepath
call plug#end()

" needs to be set after plug#end
colorscheme base16-default
set background=dark
