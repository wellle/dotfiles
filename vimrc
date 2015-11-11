set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundle 'Shougo/vimproc', {'build': {'mac': 'make -f make_mac.mak'}}
" 
" " TODO: get rid of vim-sensible
" NeoBundle 'tpope/vim-sensible'        " sane general defaults
NeoBundle 'tpope/vim-repeat'          " makes some plugins repeatable
NeoBundle 'tpope/vim-abolish'         " I mostly use :S for smart replace
NeoBundle 'tpope/vim-fugitive'        " git stuff, mostly :Gblame
NeoBundle 'tpope/vim-surround'        " add and change braces and quotes
NeoBundle 'tpope/vim-unimpaired'      " list navigation, option toggling
NeoBundle 'tpope/vim-commentary'      " motion to comment out ranges
" NeoBundle 'tpope/vim-sleuth'          " automatic indentation settings
" NeoBundle 'tpope/vim-dispatch'        " run commands in background
" NeoBundle 'tpope/vim-speeddating.git' " increment dates and times
NeoBundle 'tpope/vim-tbone'           " interact with tmux panes
" NeoBundle 'idanarye/vim-merginal'     " work with git branches
" 
NeoBundle 'coderifous/textobj-word-column.vim' " work on columns
NeoBundle 'michaeljsmith/vim-indent-object'    " work same indentation
NeoBundle 'jeetsukumaran/vim-indentwise'       " move by indentation
" 
" NeoBundle 'ntpeters/vim-better-whitespace'  " show and fix trailing space
" NeoBundle 'nelstrom/vim-qargs'              " populate args with quickfix files
" NeoBundle 'osyo-manga/vim-over'             " interactive substitution
NeoBundle 'AndrewRadev/linediff.vim'        " diff blocks of lines
" " NeoBundle 'vim-scripts/diffchar.vim'        " show diffs character by character (messes with unimpaired maps)
NeoBundle 'rking/ag.vim'                    " search in local files :Ag
NeoBundle 'kien/ctrlp.vim'                  " fuzzy find files
NeoBundle 'tommcdo/vim-lion'                " align operator glip'
NeoBundle 'tommcdo/vim-exchange'            " operator to exchange text
" NeoBundle 'tommcdo/vim-ninja-feet'          " operate to ends of text objects
NeoBundle 'bruno-/vim-vertical-move'        " move up and down in same column
" NeoBundle 'epeli/slimux'                    " interact with tmux panes
NeoBundle 'airblade/vim-gitgutter'          " show git changes with signs
" NeoBundle 'kshenoy/vim-signature'           " show and navigate marks
NeoBundle 'AndrewRadev/writable_search.vim' " search and replace across multiple files
NeoBundle 'idbrii/vim-mark'                 " highlight different words
NeoBundle 'bronson/vim-visual-star-search'  " search for visual selection
" NeoBundle 'haya14busa/incsearch.vim'        " highlight all incsearch matches
" NeoBundle 'sjl/splice.vim'
" 
" " language support
" NeoBundle 'b4winckler/vim-objc'           " objective c
" NeoBundle 'vim-scripts/javacomplete'      " java
" NeoBundle 'kana/vim-filetype-haskell'     " haskell
" NeoBundle 'tpope/vim-markdown'            " markdown
NeoBundle 'fatih/vim-go'                  " go
" NeoBundle 'exu/pgsql.vim'                 " postgres syntax highlighting
" NeoBundle 'wellle/vim-simpledb'           " sql repl (switch mappings)
" 
" " color schemes
" NeoBundle 'zenorocha/dracula-theme', {'rtp': 'vim/'}
NeoBundle 'flazz/vim-colorschemes'
" NeoBundle 'vim-scripts/Colour-Sampler-Pack'
" NeoBundle 'chriskempson/base16-vim'
" NeoBundle 'wellle/vim-colors-solarized'
" NeoBundle 'mtglsk/mushroom'
" NeoBundle 'wellsjo/wells-colorscheme.vim'
" NeoBundle 'ajgrf/sprinkles'
" NeoBundle 'vim-scripts/random.vim' " pseudo colorscheme to pick random one
" 
" " NeoBundle 'wellle/delimitMate'
" 
NeoBundle 'wellle/targets.vim'       " advanced text objects
NeoBundle 'wellle/tmux-complete.vim' " complete words from panes
" NeoBundle 'wellle/grapple.vim'       " yank without moving
" 
" if has('nvim')
"     NeoBundle 'Valloric/YouCompleteMe', {'build':{'mac':'./install.sh'}}
"     let g:tmuxcomplete#trigger = 'omnifunc'
" endif

NeoBundle 'Shougo/neocomplete.vim'

NeoBundleCheck

call neobundle#end()

" https://github.com/wellle/tmux-complete.vim/issues/63 
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Fixing an autocomplete bug with vim-notes
let g:neocomplete#force_overwrite_completefunc=1

" default
" let g:targets_seekRanges = 'lr rr ll lb ar ab lB Ar aB Ab AB rb al rB Al bb aa bB Aa BB AA'
" never seek
" let g:targets_seekRanges = 'lr lb ar ab lB Ar aB Ab AB'
" only seek current line
" let g:targets_seekRanges = 'lr rr ll'

" let g:targets_separator = [
"     \ ', . ; : + - = ~ _ * # / | \ & $',
"     \ ['x', '[^a-zA-Z]'],
"     \ ]

" let delimitMate_expand_cr = 1

colorscheme hybrid
" colorscheme tomorrow

" set quoteescape=]^\[\\-
" set quoteescape=

" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" TODO: disable [e [b ]b ]e mappingns for diffchar
" http://stackoverflow.com/questions/16059716/vim-remove-mapping-created-by-vim-plugin#comment22920168_16059873
" nmap <Plug>JumpDiffCharPrevStart <Plug>JumpDiffCharPrevStart
" nmap <Plug>JumpDiffCharNextStart <Plug>JumpDiffCharNextStart
" nmap <Plug>JumpDiffCharPrevEnd <Plug>JumpDiffCharPrevEnd
" nmap <Plug>JumpDiffCharNextEnd <Plug>JumpDiffCharNextEnd

nmap <Leader>hp <Plug>GitGutterPreviewHunk

let g:ag_highlight = 1
" let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_trailing_whitespace_error = 0

set hidden
set ignorecase " affects command line completion too
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮
set fillchars=fold:۰,diff:·
set showbreak=↪\ "
set shortmess+=I
set mouse=a
set nostartofline
set lazyredraw
set splitbelow
set splitright
set nowrap
set autoread
set foldopen-=block
set guifont=Fantasque\ Sans\ Mono:h18
set guioptions-=r

" from vim-sensible
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set incsearch
set laststatus=2
set ruler
set showcmd
set wildmenu
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set nrformats-=octal
set ttimeout
set ttimeoutlen=100
set display+=lastline
set encoding=utf-8
set formatoptions+=j " Delete comment character when joining commented lines
set fileformats+=mac
set history=1000
set viminfo^=!

inoremap <C-U> <C-G>u<C-U>

" fix some error highlighting in shell scripts
" https://groups.google.com/forum/?fromgroups#!topic/vim_dev/9f-sqmbpyyQ
let g:is_posix = 1

if exists("+breakindent")
    set breakindent
    set breakindentopt=shift:4
endif

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
" set runtimepath+=~/.fzf

let loaded_matchit = 1
runtime! plugin/sensible.vim
set gdefault
set wildmode=longest,full
set scrolloff&
set matchpairs+=<:>
nnoremap Y y$
nnoremap gV `[v`]
nnoremap Q @q

" disable roman numerals
" runtime! plugin/speeddating.vim
" SpeedDatingFormat! %v
" SpeedDatingFormat! %^v

set statusline=
set statusline+=%f
set statusline+=%(\ [%{fugitive#head()}%Y%R%W%M]%)
set statusline+=%=
set statusline+=[%(%l,%c%V%)]
set statusline+=\ %P
" highlight user1 cterm=bold ctermbg=0 ctermfg=11

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

" change current word and prepare to repeat next occurence (like *cgn)
nnoremap c* :<C-U>let @/='\<'.expand("<cword>").'\>'<CR>:set hlsearch<CR>cgn

nnoremap <silent> <leader>gi :GoImports<CR>
" go test in right pane
nnoremap <silent> <leader>gt :w<CR>:call tbone#send_keys('right', "<C-V><C-C><C-V><C-L>got<C-V><CR>")<CR>
" rerun previous command in right pane
nnoremap <silent> <leader>tp :w<CR>:call tbone#send_keys('right', "<C-V><C-C><C-V><C-L><C-V><C-P><C-V><CR>")<CR>

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

" TODO: fix on this text, visually select lines containing =, run `:norm df=A,`, doesn't work
" aoeu
" x = b
" y = c
" snth
