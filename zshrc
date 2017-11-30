# https://wiki.gentoo.org/wiki/Zsh/HOWTO

# TODO: split in separate files like https://github.com/ivyl/zsh-config

autoload -U compinit
compinit

export CORRECT_IGNORE='_*'

if [ -e ~/.zsh/zsh-syntax-highlighting ]; then
    source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [ -e ~/.zsh/opp.zsh ]; then
    source $HOME/.zsh/opp.zsh/opp.zsh
    source $HOME/.zsh/opp.zsh/opp/surround.zsh
    source $HOME/.zsh/opp.zsh/opp/textobj-between.zsh
fi

zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'   # formatting?
zstyle ':completion:*:default' select-prompt '%S%M matches%s' # do we want a select-prompt?
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache true

zstyle ':vcs_info:*' formats '%F{blue}%s%f:%F{green}%.16b%f '
zstyle ':vcs_info:*' actionformats '%F{blue}%s%f:%F{green}%.16b%f:%F{magenta}%a%f '
zstyle ':vcs_info:*' enable git hg

setopt prompt_subst
autoload -Uz vcs_info
precmd() { vcs_info }
PROMPT=$'%f${vcs_info_msg_0_}%f%F{yellow}%1~%F{magenta}:%f ' # %F{green}❱
PROMPT2='%F{yellow}%_ %f%f '                               # %F{green}❭

export HISTSIZE=2000
export HISTFILE=$HOME/.zsh/history
export SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt extended_history
setopt autopushd # use `cd -<tab>` to select recent dir
setopt autocd

setopt extended_glob # for ~ and ^ in patterns

# http://zsh.sourceforge.net/FAQ/zshfaq03.html
# allow binding of ^s and ^q (was stop/resume output)
setopt no_flow_control

# allow unescaped patterns without raising an error
# http://www.derekwyatt.org/2012/03/16/back-to-zsh/
unsetopt nomatch

# https://github.com/ivyl/zsh-config/blob/master/bindings.zsh
bindkey -v

export EDITOR=vim
export KEYTIMEOUT=1
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'
export MANPAGER="col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -"

bindkey -M vicmd '~'  vi-swap-case
bindkey -M vicmd 'u'  undo
bindkey -M vicmd '^r' redo

bindkey -M viins '^?' backward-delete-char # backspace
bindkey -M viins '^[[Z' reverse-menu-complete # shift-tab
bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line
bindkey -M viins '^h' backward-delete-char
bindkey -M viins '^k' kill-line
bindkey -M viins '^n' down-history
bindkey -M viins '^p' up-history
bindkey -M viins "^r" history-incremental-pattern-search-backward
bindkey -M viins "^s" history-incremental-pattern-search-forward
bindkey -M viins '^u' backward-kill-line
bindkey -M viins '^w' backward-delete-word
bindkey -M viins '^y' yank

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^f' edit-command-line

# export GOROOT=/usr/local/Cellar/go/1.4.2/libexec
export GOPATH=$HOME/Code/go

export GEM_HOME=$HOME/.gem
export GEM_PATH=$HOME/.gem

export PATH=$HOME/dotfiles/bin:$GOPATH/bin:$GEM_PATH/bin:/usr/local/sbin:/usr/local/bin:/Users/welle/protoc-3/bin:$PATH
# default zsh PATH: /usr/bin:/bin:/usr/sbin:/sbin

# source /usr/local/go/misc/zsh/go

# aliases
alias ls='ls -FG'
alias c-='cd -'
alias grep='grep --color'

alias vim='nvim -w ~/.vim/scriptout'
alias vimscratch='vim -c "set buftype=nowrite"'

alias zshconfig='vim ~/dotfiles/zshrc'
alias zshsource='source ~/dotfiles/zshrc'
alias tmuxconfig='vim ~/dotfiles/tmux.conf'
alias vimconfig='vim ~/.config/nvim/init.vim'
alias vimscriptout='vim ~/.vim/scriptout'
alias vimini='vim -u ~/.vimini/vimrc'
alias viminiconfig='vim ~/.vimini/vimrc'
alias mux='~/Dropbox/tmux.start'
alias muxconfig='vim ~/Dropbox/tmux.start'

alias bing='afplay /System/Library/Sounds/Ping.aiff -v 2'

# alias protoc='~/protoc-3/bin/protoc'

# https://github.com/tmux/tmux/issues/108#issuecomment-145654960
alias bug="sudo kill $(ps aux | grep '[n]otifyd' | awk '{print $2}')"

source ~/dotfiles/aliasgit.zsh

# go aliases
alias gof='go fmt ./...'
alias gob='go build'
alias gor='go run *.go'
alias got='go test'
alias gotr='go test -run'
alias gotf='go test -gocheck.f'
alias gotb='go test -gocheck.b'

alias ag='ag --ignore "*.log" --ignore vendor'
alias agi='ag --ignore "*_test.go" --ignore "*_easyjson*"'
alias agc='ag -c'
alias agic='agi -c'

function vimag  { vim -c "Ag --ignore "*.log" --ignore vendor '$*'" }
function vimagi { vim -c "Ag --ignore "*.log" --ignore vendor --ignore '*_test.go' --ignore '*_easyjson*' '$*'" }
alias vimagc='vimag'
alias vimagic='vimagi'

# global aliases
# alias -g not="*~*_test.go~*/*_test.go" # no tests # doesn't work for nested folders...

export POSTGRESLOG=/usr/local/var/postgres/server.log

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# # https://github.com/cdlm/infrastructure/blob/master/dotfiles/zsh/rc/zz.highlighting.zsh
# if [[ $COLORFGBG = *';15' ]]; then
#     # solarized light
#     ZSH_HIGHLIGHT_STYLES[default]='fg=green,bold' #base01
#     ZSH_HIGHLIGHT_STYLES[alias]='fg=black'
#     ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow'
#     ZSH_HIGHLIGHT_STYLES[function]='fg=black'
#     ZSH_HIGHLIGHT_STYLES[command]='fg=black'
#     ZSH_HIGHLIGHT_STYLES[precommand]='fg=black'
#     ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=cyan,bold' #base1
#     ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
#     ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=yellow,bold' #base00
#     ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow,bold' #base00
#     ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=red,bold' #orange
# else
#     # solarized dark
#     ZSH_HIGHLIGHT_STYLES[default]='fg=cyan,bold' #base1
#     ZSH_HIGHLIGHT_STYLES[alias]='fg=white'
#     ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow'
#     ZSH_HIGHLIGHT_STYLES[function]='fg=white'
#     ZSH_HIGHLIGHT_STYLES[command]='fg=white'
#     ZSH_HIGHLIGHT_STYLES[precommand]='fg=white'
#     ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=green,bold' #base01
#     ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
#     ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue,bold' #base0
#     ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue,bold' #base0
#     ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=red,bold' #orange
# fi

# http://chneukirchen.org/blog/archive/2012/02/10-new-zsh-tricks-you-may-not-know.html
# improved version that uses vim instead of less
function zman() {
    MANPAGER="col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' +/'^       $1' -" man zshall
}

# https://github.com/rupa/z
if [ -e /usr/local/etc/profile.d/z.sh ]; then
    . /usr/local/etc/profile.d/z.sh
fi

# https://github.com/supercrabtree/k
if [ -e ~/code/k/k.sh ]; then
    source ~/code/k/k.sh
fi

source ~/dotfiles/fzf.zsh

# disable software control flow <C-S> and <C-Q>
stty -ixon
stty -ixoff

echo $(date) >> ~/.zsh/dates

# http://stackoverflow.com/a/9810485/3451033
# __git_files () {
#     _wanted files expl 'local files' _files
# }

# TODO: try https://github.com/tarruda/zsh-autosuggestions

# TODO: use incremental pattern search?
# http://chneukirchen.org/blog/archive/2012/02/10-new-zsh-tricks-you-may-not-know.html
# bindkey "^R" history-incremental-pattern-search-backward
# bindkey "^S" history-incremental-pattern-search-forward
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# TODO: extact fzf functions again
# fshow - git commit browser (enter for show, ctrl-d for diff, ` toggles sort)
fshow() {
  local out shas sha q k
  while out=$(
      git log --graph --color=always \
          --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
      fzf --ansi --multi --no-sort --reverse --query="$q" --tiebreak=index \
          --print-query --expect=ctrl-d --toggle-sort=\`); do
    q=$(head -1 <<< "$out")
    k=$(head -2 <<< "$out" | tail -1)
    shas=$(sed '1,2d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
    [ -z "$shas" ] && continue
    if [ "$k" = 'ctrl-d' ]; then
      git diff --color=always $shas | less -R
    else
      for sha in $shas; do
        git show --color=always $sha | less -R
      done
    fi
  done
}

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# source ~/.gem/gems/tmuxinator-0.6.11/completion/tmuxinator.zsh

ulimit -n 512
