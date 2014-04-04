# https://wiki.gentoo.org/wiki/Zsh/HOWTO

# TODO: split in separate files like https://github.com/ivyl/zsh-config

autoload -U compinit
compinit

export CORRECT_IGNORE='_*'

source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source $HOME/.zsh/opp.zsh/opp.zsh
source /Users/welle/.zsh/opp.zsh/opp/surround.zsh
source /Users/welle/.zsh/opp.zsh/opp/textobj-between.zsh

zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'   # formatting?
zstyle ':completion:*:default' select-prompt '%S%M matches%s' # do we want a select-prompt?
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache true

zstyle ':vcs_info:*' formats '%F{blue}%s%f:%F{yellow}%.16b%f '
zstyle ':vcs_info:*' actionformats '%F{blue}%s%f:%F{yellow}%.16b%f:%F{magenta}%a%f '
zstyle ':vcs_info:*' enable git hg

setopt prompt_subst
autoload -Uz vcs_info
precmd() { vcs_info }
PROMPT=$'%f${vcs_info_msg_0_}%f%F{cyan}%1~%F{magenta}:%f ' # %F{green}❱
PROMPT2='%F{yellow}%_ %f%f '                               # %F{green}❭

export HISTSIZE=2000
export HISTFILE=$HOME/.zsh/history
export SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt extended_history
setopt autopushd # use `cd -<tab>` to select recent dir
setopt autocd

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
bindkey -M viins '^r' history-substring-search-up
bindkey -M viins '^s' history-substring-search-down
bindkey -M viins '^u' backward-kill-line
bindkey -M viins '^w' backward-delete-word
bindkey -M viins '^y' yank

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^f' edit-command-line

export GOROOT=/usr/local/go
export GOPATH=$HOME/Code/go

export GEM_HOME=$HOME/.gem
export GEM_PATH=$HOME/.gem

export PATH=$GEM_PATH/bin:$PATH

source $GOROOT/misc/zsh/go

# aliases
alias ls='ls -FG'
alias c-='cd -'

alias -g vim='vim -w ~/.vim/scriptout'
alias -g vi='vim -w ~/.vim/scriptout'
alias -g v='vim -w ~/.vim/scriptout'

alias -g json='python -mjson.tool'

alias zshconfig='vim ~/.zshrc'
alias zshsource='source ~/.zshrc'
alias tmuxconfig='vim ~/.tmux.conf'
alias vimconfig='vim ~/.vimrc'
alias vimscriptout='vim ~/.vim/scriptout'
alias vimini='~/Code/vim-clean/src/vim -u ~/.vim_mini/vimrc'
alias viminiconfig='vim ~/.vim_mini/vimrc'
alias mux='~/.tmux.start'
alias muxconfig='vim ~/.tmux.start'

source ~/dotfiles/aliasgit.zsh

# go aliases
alias gof='go fmt ./...'
alias gob='go build'
alias gor='go run *.go'
alias got='go test'
alias gotf='go test -gocheck.f'

function vimag { vim -c "Ag '$*'" }

export VIMRUNTIME=/usr/share/vim/vim73/vim74
export POSTGRESLOG=/usr/local/var/postgres/server.log

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# https://github.com/cdlm/infrastructure/blob/master/dotfiles/zsh/rc/zz.highlighting.zsh
if [[ $COLORFGBG = *';15' ]]; then
    # solarized light
    ZSH_HIGHLIGHT_STYLES[default]='fg=green,bold' #base01
    ZSH_HIGHLIGHT_STYLES[alias]='fg=black'
    ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow'
    ZSH_HIGHLIGHT_STYLES[function]='fg=black'
    ZSH_HIGHLIGHT_STYLES[command]='fg=black'
    ZSH_HIGHLIGHT_STYLES[precommand]='fg=black'
    ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=cyan,bold' #base1
    ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=yellow,bold' #base00
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow,bold' #base00
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=red,bold' #orange
else
    # solarized dark
    ZSH_HIGHLIGHT_STYLES[default]='fg=cyan,bold' #base1
    ZSH_HIGHLIGHT_STYLES[alias]='fg=white'
    ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow'
    ZSH_HIGHLIGHT_STYLES[function]='fg=white'
    ZSH_HIGHLIGHT_STYLES[command]='fg=white'
    ZSH_HIGHLIGHT_STYLES[precommand]='fg=white'
    ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=green,bold' #base01
    ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue,bold' #base0
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue,bold' #base0
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=red,bold' #orange
fi

# http://chneukirchen.org/blog/archive/2012/02/10-new-zsh-tricks-you-may-not-know.html
# improved version that uses vim instead of less
function zman() {
    MANPAGER="col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' +/'^       $1' -" man zshall
}

# https://github.com/rupa/z
source ~/code/z/z.sh

source ~/dotfiles/fzf.zsh

# http://stackoverflow.com/a/9810485/3451033
# __git_files () {
#     _wanted files expl 'local files' _files
# }

# TODO: try https://github.com/tarruda/zsh-autosuggestions

# TODO: use incremental pattern search?
# http://chneukirchen.org/blog/archive/2012/02/10-new-zsh-tricks-you-may-not-know.html
# bindkey "^R" history-incremental-pattern-search-backward
# bindkey "^S" history-incremental-pattern-search-forward
