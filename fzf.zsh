# Key bindings
# ------------
# CTRL-T - Paste the selected file path(s) into the command line
__fsel() {
  set -o nonomatch
  find * -path '*/\.*' -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | fzf -m | while read item; do
    printf '%q ' "$item"
  done
  echo
}

if [[ $- =~ i ]]; then

if [ -n "$TMUX_PANE" -a ${FZF_TMUX:-1} -ne 0 -a ${LINES:-40} -gt 15 ]; then
  fzf-file-widget() {
    local height
    height=${FZF_TMUX_HEIGHT:-40%}
    if [[ $height =~ %$ ]]; then
      height="-p ${height%\%}"
    else
      height="-l $height"
    fi
    tmux split-window $height "zsh -c 'source ~/.fzf.zsh; tmux send-keys -t $TMUX_PANE \"\$(__fsel)\"'"
  }
else
  fzf-file-widget() {
    LBUFFER="${LBUFFER%% #}$(__fsel)"
    zle redisplay
  }
fi
zle     -N   fzf-file-widget
bindkey '^T' fzf-file-widget

fi

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# fh - repeat history
fh() {
  eval $(('fc' -l 1 || 'history') | fzf +s | sed 's/ *[0-9]* *//')
}

# fs [FUZZY PATTERN] - Select selected tmux session
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fs() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}
