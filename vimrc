set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {'build': {'mac': 'make -f make_mac.mak'}}
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'tsukkee/unite-tag'

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
NeoBundle 'wellle/vim-tbone'          " interact with tmux panes (extract tbone#send_keys)

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
NeoBundle 'bruno-/vim-vertical-move'       " move up and down in same column
NeoBundle 'epeli/slimux'                   " interact with tmux panes
NeoBundle 'wellle/vim-gitgutter'           " show git changes with signs (fix colors)

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
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮
set fillchars=stl:―,stlnc:—,vert:│,fold:۰,diff:·
set showbreak=↪\ "
set shortmess+=I
set mouse=a
set nostartofline
set lazyredraw

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
map Y y$

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

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
nnoremap <silent> <Leader>p :<C-u>Unite -toggle -auto-resize -buffer-name=files -start-insert file_rec/async<cr><c-u>

" experimental

onoremap ae :<C-U>normal! ggVG<CR>
xnoremap ae :<C-U>normal! ggVG<CR>

" filter only visually selected text, not linewise
" http://stackoverflow.com/questions/9637921/vim-filter-only-visual-selection-not-the-entire-line
" TODO: extract plugin vim-visual-filter?
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

" next and last text objects
" https://gist.github.com/sjl/3762227
" TODO: extract plugin?
" onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
" xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
" onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
" xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

" onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
" xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
" onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
" xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

" function! s:NextTextObject(motion, dir)
"   let c = nr2char(getchar())

"   if c ==# "b"
"       let c = "("
"   elseif c ==# "B"
"       let c = "{"
"   elseif c ==# "r"
"       let c = "["
"   endif

"   exe "normal! ".a:dir.c."v".a:motion.c
" endfunction

" my own attempt to make it repeatable:
" source ~/.vim/welle/textobj2.vim
" source ~/.vim/welle/yank.vim

" in between pair of characters text objects
" http://www.reddit.com/r/vim/comments/1btmhz/textobjectify_vim_plugin_to_improve_textobjects/c9a3q82
" for char in [ "_", ".", ":", ",", ";", "<bar>", "/", "<bslash>", "*" ]
"   execute "xnoremap i" . char . " :<C-U>silent!normal!T" . char . "vt" . char . "<CR>"
"   execute "onoremap i" . char . " :normal vi" . char . "<CR>"
"   execute "xnoremap a" . char . " :<C-U>silent!normal!F" . char . "vf" . char . "<CR>"
"   execute "onoremap a" . char . " :normal va" . char . "<CR>"
" endfor

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
" TODO: make ci" and ca" search backwards if needed to make it
" repeatable even if the cursor ends up at the end of the line
" TODO: make f,dt. repeatable?
" TODO: fix bug regarding gn:
" - create file with some contents, check `:set ws` is on
" - replace all occurences of a word with `cgn` and repetition
" - observe that `:set ws` is now off
" `vim -c 'exe "norm afoo\<Esc>gg*cgnbar\<Esc>"  | :set ws?'` ->   wrapscan
" `vim -c 'exe "norm afoo\<Esc>gg*cgnbar\<Esc>." | :set ws?'` -> nowrapscan
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
