" ~/.config/nvim/init.vim
syntax on

" settings

set gdefault
set hidden
set ignorecase
set lazyredraw
set nostartofline
set showcmd
set termguicolors
set belloff=

set foldopen-=block
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,eol:¶
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set wildmode=longest,full

if has('nvim')
    set termguicolors
    set inccommand=split
end

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

" don't store paragraph motions in jump list
" http://superuser.com/a/836924
nnoremap <silent> } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap <silent> { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>

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

if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    " tnoremap <A-h> <C-\><C-n><C-w>h
    " tnoremap <A-j> <C-\><C-n><C-w>j
    " tnoremap <A-k> <C-\><C-n><C-w>k
    " tnoremap <A-l> <C-\><C-n><C-w>l
    " nnoremap <A-h> <C-w>h
    " nnoremap <A-j> <C-w>j
    " nnoremap <A-k> <C-w>k
    " nnoremap <A-l> <C-w>l
end

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
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'idbrii/vim-mark'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'mbbill/undotree'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rhubarb'
Plug 'vim-scripts/ScrollColors'
Plug 'neomake/neomake'
Plug 'sjl/splice.vim'

" colorscheems
Plug 'chriskempson/base16-vim'
Plug 'sts10/vim-mustard'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" https://github.com/junegunn/fzf.vim/issues/47#issuecomment-160237795
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <c-p> :ProjectFiles<cr>

Plug 'tommcdo/vim-lion'
let b:lion_squeeze_spaces = 1

Plug '~/code/nvim-editcommand'
let g:editcommand_prompt = ':'

Plug 'rking/ag.vim'
let g:ag_highlight = 1

Plug 'fatih/vim-go'
let g:go_highlight_methods = 1
let g:go_highlight_trailing_whitespace_error = 0

Plug 'bronson/vim-visual-star-search' " must be after vim-mark because of mapping clash? check and fix!

" local plugins
" TODO: use local versions again?
" vimplug doesn't have repository history

" Plug 'wellle/targets.vim'
Plug '~/code/targets.vim'
" Plug 'wellle/targets.vim', {'on' : []}
" Plug '~/code/targets.vim', {'on' : []}
" augroup LoadDuringHold_Targets
"     autocmd!
"     autocmd CursorHold,CursorHoldI * call plug#load('targets.vim') | autocmd! LoadDuringHold_Targets
" augroup end

let g:targets_quotes = '"q '' `'
" let g:targets_nlNL = 'nN  '
" let g:targets_addJumplist = 1
" let g:targets_jumpRanges = 'rr rb rB bb bB BB ll al Al aa Aa AA'
" let g:targets_separators = ',c . ; : + - = ~ _ * # / | \ & $'
" let g:targets_argTrigger = ','
" let g:targets_seekRanges = 'cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB rr ll rb al rB Al bb aa bB Aa BB AA'
" set selection=exclusive

Plug '~/code/visual-split.vim'

Plug '~/code/tmux-complete.vim' " deoplete completion makes deoplete slow :(
" let g:tmuxcomplete#trigger = ''

" for testing
" for https://github.com/wellle/tmux-complete.vim/issues/67
" Plug 'Shougo/deoplete.nvim'
" let g:deoplete#enable_at_startup = 1
" Plug 'zchee/deoplete-go', { 'do': 'make'}
" check code of this plugin: https://github.com/Shougo/neco-syntax
" Plug 'Shougo/neco-syntax'
" Plug 'Shougo/neocomplcache.vim'
" let g:neocomplcache_enable_at_startup = 1
" Plug 'terryma/vim-expand-region'
" vmap <Space> <Plug>(expand_region_expand)
" vmap <BS> <Plug>(expand_region_shrink)

" Add plugins to &runtimepath
call plug#end()

set statusline=
set statusline+=%f
" if exists('g:loaded_fugitive') 
set statusline+=%(\ [%{fugitive#head()}%Y%R%W%M]%) " TODO: use try/catch here?
" else
"     set statusline+=%(\ [%Y%R%W%M]%)
" endif
set statusline+=%=
set statusline+=[%(%l,%c%V%)]
set statusline+=\ %P

" needs to be set after plug#end
silent! colorscheme base16-default-dark
" silent! colorscheme base16-default-light
" set background=dark
"
highlight! link Visual MarkWord5
" highlight! link TermCursor MarkWord2
" highlight! link Cursor MarkWord2
