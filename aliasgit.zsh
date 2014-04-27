alias g='git'
alias ga='g add'
alias gaa='ga --all'
alias gam='gc --amend'
alias gama='gam --all'
alias gamah='gama --no-edit'
alias gamh='gam --no-edit'
alias gap='ga --patch'
alias gb='g branch'
alias gbD='gb -D'
alias gba='gb --all'
alias gbd='gb --delete'
alias gbm='gb --move'
alias gbs='g bisect'
alias gbsb='gbs bad'
alias gbsg='gbs good'
alias gbsr='gbs reset'
alias gbss='gbs start'
alias gc='g commit --verbose'
alias gca='gc --all'
alias gcaf='gca --fixup'
alias gcam='gca --message'
alias gcaw='gcam WIP'
alias gcf='gc --fixup'
alias gcl='g clone'
alias gcm='gc --message'
alias gco='g checkout'
alias gcob='gco -b'
alias gcom='gco master'
alias gcop='gco --patch'
alias gcp='g cherry-pick'
alias gd='g diff'
alias gdc='gd --cached'
alias gdcs='gdc --stat'
alias gdis='gd --ignore-all-space'
alias gdm='gd master'
alias gdms='gdm --stat'
alias gds='gd --stat'
alias gdw='gd --color-words'
alias gf='g fetch'
alias gfp='gf --prune'
alias gfu='gf upstream'
alias gh='g help'
alias gl='g log --graph --boundary --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
alias gla='gl --all'
alias glam='gla --ancestry-path master..'
alias glm='gl master..'
alias glms='glm --stat'
alias gp='g push'
alias gpf='gp --force'
alias gpo='gp origin'
alias gpt='gp --tags'
alias gpu='gp --set-upstream origin head'
alias grb='g rebase'
alias grba='grb --abort'
alias grbc='grb --continue'
alias grbi='grb --interactive --autosquash'
alias grbim='grbi master'
alias grbm='grb master'
alias grbo='grb --onto'
alias grbom='grb origin/master'
alias grbs='grb --skip'
alias grbu='grb upstream/master'
alias grl='g log --walk-reflogs --boundary --pretty=format:"%cd %h %gd %gs"'
alias grm='g rm'
alias grs='g reset'
alias grs^='grs head^'
alias grsh='grs --hard'
alias grsp='grs --patch'
alias grv='g revert'
alias gs='g status --short' # --branch
alias gsh='g show'
alias gshs='gsh --stat'
alias gshw='gsh --color-words'
alias gst='g stash'
alias gstdr='gst drop'
alias gstk='gst --keep-index'
alias gstl='gst list'
alias gstp='gst pop'
alias gsts='gst show'
alias gstsp='gsts -p'
alias gt='git tag'
alias gta='gt --annotate'
alias gtd='gt --delete'
alias gtl='gt --list -n'
