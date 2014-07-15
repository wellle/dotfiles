set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {'build': {'mac': 'make -f make_mac.mak'}}

" TODO: get rid of vim-sensible
NeoBundle 'tpope/vim-sensible'        " sane general defaults
NeoBundle 'tpope/vim-repeat'          " makes some plugins repeatable
NeoBundle 'tpope/vim-abolish'         " I mostly use :S for smart replace
NeoBundle 'tpope/vim-fugitive'        " git stuff, mostly :Gblame
NeoBundle 'tpope/vim-surround'        " add and change braces and quotes
NeoBundle 'tpope/vim-unimpaired'      " list navigation, option toggling
NeoBundle 'tpope/vim-commentary'      " motion to comment out ranges
NeoBundle 'tpope/vim-sleuth'          " automatic indentation settings
NeoBundle 'tpope/vim-dispatch'        " run commands in background
NeoBundle 'tpope/vim-speeddating.git' " increment dates and times
NeoBundle 'tpope/vim-tbone'           " interact with tmux panes

NeoBundle 'coderifous/textobj-word-column.vim' " work on columns
NeoBundle 'michaeljsmith/vim-indent-object'    " work same indentation

NeoBundle 'wellle/vim-colors-solarized'    " cororscheme (signColumn + minor tweaks)
NeoBundle 'wellle/vim-visual-star-search'  " search for visual selection (restore register)
NeoBundle 'ntpeters/vim-better-whitespace' " show and fix trailing space
NeoBundle 'nelstrom/vim-qargs'             " populate args with quickfix files
NeoBundle 'osyo-manga/vim-over'            " interactive substitution
NeoBundle 'AndrewRadev/linediff.vim'       " diff blocks of lines
NeoBundle 'rking/ag.vim'                   " search in local files :Ag
NeoBundle 'kien/ctrlp.vim'                 " fuzzy find files
NeoBundle 'tommcdo/vim-lion'               " align operator glip'
NeoBundle 'tommcdo/vim-exchange'           " operator to exchange text
NeoBundle 'tommcdo/vim-ninja-feet'         " operate to ends of text objects
NeoBundle 'bruno-/vim-vertical-move'       " move up and down in same column
NeoBundle 'epeli/slimux'                   " interact with tmux panes
NeoBundle 'airblade/vim-gitgutter'         " show git changes with signs
NeoBundle 'kshenoy/vim-signature'          " show and navigate marks

" language support
NeoBundle 'b4winckler/vim-objc'           " objective c
NeoBundle 'vim-scripts/javacomplete'      " java
NeoBundle 'kana/vim-filetype-haskell'     " haskell
NeoBundle 'tpope/vim-markdown'            " markdown
NeoBundle 'nsf/gocode', {'rtp': 'vim'}    " go
NeoBundle 'benmills/vim-golang-alternate' " switch to go test file :A
NeoBundle 'wellle/vim-simpledb'           " sql repl (switch mappings)

NeoBundle 'wellle/targets.vim'       " advanced text objects
NeoBundle 'wellle/tmux-complete.vim' " complete words from panes

NeoBundleCheck

set hidden
set ignorecase " affects command line completion too
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮
set fillchars=stl:―,stlnc:—,vert:│,fold:۰,diff:·
set showbreak=↪\ "
set shortmess+=I
set mouse=a
set nostartofline
set lazyredraw
set nowrap
set autoread
set foldopen-=block
set breakindent
set breakindentopt=shift:4

if has("persistent_undo")
    set swapfile directory=~/.vimtemp/swap//
    set backup backupdir=~/.vimtemp/backup//
    set undofile undodir=~/.vimtemp/undo//
endif

nnoremap <Leader>a <c-^>
nnoremap <Leader>s :write \| source %<CR>

cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-p> <up>
cnoremap <c-n> <down>

set runtimepath+=$GOROOT/misc/vim

let loaded_matchit = 1
runtime! plugin/sensible.vim
set gdefault
set wildmode=longest,full
set scrolloff&
set matchpairs+=<:>
nnoremap Y y$
nnoremap gV `[v`]

" disable roman numerals
runtime! plugin/speeddating.vim
SpeedDatingFormat! %v
SpeedDatingFormat! %^v

let g:solarized_termtrans=1
colorscheme solarized
set background=dark

set statusline=
set statusline+=%1*%f%*
set statusline+=%(\ [%{fugitive#head()}%Y%R%W%M]%)
set statusline+=%=
set statusline+=[%(%l,%c%V%)]
set statusline+=\ %1*%P%*
highlight user1 cterm=none ctermbg=none ctermfg=3

if has("autocmd")
    augroup autocommands
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
        autocmd BufReadPost *.sql nnoremap <buffer> <enter> m':'{,'}SimpleDBExecuteSql<cr>g`'
        " autocmd BufWritePost .vimrc source %
    augroup END
endif

vmap . :normal .<CR>

let g:netrw_liststyle=3

" set t_ti= t_te= " don't clear scrollback buffer

nnoremap <leader>fs :set foldmethod=syntax<CR>
nnoremap <leader>fm :set foldmethod=manual<CR>

" go test in right pane
nnoremap <silent> <leader>gt :w<CR>:call tbone#send_keys('right', "<C-V><C-C><C-V><C-L>got<C-V><CR>")<CR>

" experimental

onoremap ae :<C-U>normal! ggVG<CR>
xnoremap ae :<C-U>normal! ggVG<CR>

let g:SignatureMap = {
            \ 'GotoNextLineAlpha' : "",
            \ 'GotoPrevLineAlpha' : "",
            \ 'GotoNextSpotAlpha' : "",
            \ 'GotoPrevSpotAlpha' : "",
            \ }

" filter only visually selected text, not linewise
" http://stackoverflow.com/questions/9637921/vim-filter-only-visual-selection-not-the-entire-line
" TODO: extract plugin vim-visual-filter?
" TODO: doesn't seem to be working for visual block mode. remove?
nnoremap <silent> <Leader>! :set opfunc=ProgramFilter<cr>g@
vnoremap <silent> <Leader>! :<c-u>call ProgramFilter(visualmode(), 1)<cr>
function! ProgramFilter(vt, ...)
    let [qr, qt] = [getreg('"'), getregtype('"')]
    let [oai, ocin, osi, oinde] = [&ai, &cin, &si, &inde]
    setl noai nocin nosi inde=

    let [sm, em] = ['[<'[a:0], ']>'[a:0]]
    exe 'norm!`' . sm . a:vt . '`' . em . 'x'

    call inputsave()
    let cmd = input('!')
    call inputrestore()

    let out = system(cmd, @")
    let out = substitute(out, '\n$', '', '')
    exe "norm!i\<c-r>=out\r"

    let [&ai, &cin, &si, &inde] = [oai, ocin, osi, oinde]
    call setreg('"', qr, qt)
endfunction

" https://gist.github.com/wellle/9289224
" TODO: make repeatable
" nnoremap <silent> <Leader>a :set opfunc=Append<CR>g@
" nnoremap <silent> <Leader>i :set opfunc=Insert<CR>g@

" function! Append(type, ...)
"     call feedkeys("`]a", 'n')
" endfunction

" function! Insert(type, ...)
"     call feedkeys("`[i", 'n')
" endfunction

" TODO: check what takes long with `vim --startuptime filename` and optimize

" idea: add completion mode for last inserted texts that start with the
" current insertion
" example: itext1<esc>Afoo<esc>Itex<^X^@> would complete to text1

" TODO: make % work like this:
" - dV% should delete linewise, not characterwise
" - di% should delete inside
" - da% should delete around (like d% already does)
" NOTE: it works this way, but the matchit plugin breaks this
" /usr/local/share/vim/macros/matchit.vim
" TODO: make f,dt. repeatable?
" TODO: vi{ inside {} should select zero characters, so that a subsequent c
" basically starts inserting inside the {}. so is needed to make cin{ work in
" that case. workaround: use f{a instead, but doesn't handle repetition over
" empty and nonempty pairs

" TODO: autocommand issue: insert line "foo bar ". At end of line press `cb`
" to change "bar". Notice how trailing whitespaces are now highlighted while
" being in insert mode

" idea: motion z% jump to matching fold start/end
" idea: add insert mode to vim-surround that closes all unmatched parens:
"   `ysipiif (false) {<esc>` would close the `{` after the block in one stroke
" idea: ^N^X^L should complete lines that contain the completed word
