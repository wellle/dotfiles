# alias gl='g log --date=local --graph --boundary --pretty=format:"%C(auto)%h - %s%d %C(yellow)(%cd) %C(reset)%an"' # committer date
alias g='git'
alias ga.='ga .'
alias ga='g add'
alias gaa='ga --all :/'
alias gaarbc='gaa && grbc'
alias gam.='gam .'
alias gam.h='gam. --no-edit'
alias gam='gc --amend'
alias gama='gam --all'
alias gamah='gama --no-edit'
alias gamahpF='gamah && gpF'
alias gamh='gam --no-edit'
alias gap.='gap .'
alias gap='ga --patch'
alias gau='ga --update'
alias gb='g branch'
alias gbD='gb -D'
alias gbF='gb --force'
alias gbFmo/m='gbF master origin/master'
alias gba='gb --all'
alias gbc='g rev-parse --abbrev-ref head | tr -d "\n" | pbcopy'
alias gbd='gb --delete'
alias gbm='gb --move'
alias gbs='g bisect'
alias gbsb='gbs bad'
alias gbsg='gbs good'
alias gbsr='gbs reset'
alias gbss='gbs start'
alias gc.='gc .'
alias gc.f='gc. --fixup'
alias gc.m='gc. --message'
alias gc='g commit --verbose'
alias gca='gc --all'
alias gcaf='gca --fixup'
alias gcam='gca --message'
alias gcaw='gcam WIP'
alias gcf='gc --fixup'
alias gcl='g clone'
alias gcm='gc --message'
alias gco-='gco - '
alias gco.='gco . '
alias gco='g checkout'
alias gcoB='gco -B'
alias gcob='gco -b'
alias gcom='gco master'
alias gcop='gco --patch'
alias gcp='g cherry-pick'
alias gcpa='gcp --abort'
alias gcpc='gcp --continue'
alias gcw='gcm WIP'
alias gd.='gd .'
alias gd='g diff'
alias gdc.='gdc .'
alias gdc='gd --cached'
alias gdcis='gdc --ignore-all-space'
alias gdcs='gdc --stat'
alias gdcw='gdc --color-words'
alias gdis='gd --ignore-all-space'
alias gdism='gdis master'
alias gdm.='gdm .'
alias gdm.='gdm .'
alias gdm='gd master'
alias gdmis='gdm --ignore-all-space'
alias gdms.='gdms .'
alias gdms='gdm --stat'
alias gdmss='gdm --shortstat'
alias gdmw='gdm --color-words'
alias gdo='gd origin/$(g rev-parse --abbrev-ref head)..head'
alias gdos='gdo --stat'
alias gds.='gds .'
alias gds='gd --stat'
alias gdss='gd --shortstat'
alias gdw='gd --color-words'
alias gf='g fetch'
alias gfp='gf --prune'
alias gft='gf --tags'
alias gfu='gf upstream'
alias gh='g help'
alias gim='g imerge'
alias gimc='gim continue'
alias gimd='gim diagram'
alias gimf='gim finish'
alias gimrb='gim rebase'
alias gimrbm='gimrb master'
alias gl1='gl -1'
alias gl='g log --date=local --graph --boundary --pretty=format:"%C(auto)%h - %s%d %C(yellow)(%ad) %C(reset)%an"' # author date
alias glS='gl -S'
alias gla='gl --branches --remotes --tags HEAD' # exclude stashes
alias glam='gla --ancestry-path master..'
alias glaom='gla --ancestry-path origin/master..'
alias glas='gla --stat'
alias glm.='glm .'
alias glm='gl master..'
alias glmp='glms --patch'
alias glms='glm --stat'
alias glmss='glm --shortstat'
alias glo/m='gl origin/master'
alias glp='gls --patch'
alias glpS='glp -S'
alias gls='gl --stat'
alias glss='gl --shortstat'
alias glt='gl --tags --simplify-by-decoration'
alias gp='g push'
alias gpF='gp --force-with-lease'
alias gpo='gp origin'
alias gpod='gpo --delete'
alias gpt='gp --tags'
alias gpu='gp --set-upstream origin head'
alias gr='g remote'
alias gra='gr add'
alias grau='gra upstream'
alias grb='g rebase'
alias grba='grb --abort'
alias grbc='grb --continue'
alias grbi='grb --interactive --autosquash'
alias grbim='grbi master'
alias grbio='grbi --onto'
alias grbm='grb master'
alias grbmp='grbm --preserve-merges'
alias grbo/m='grb origin/master'
alias grbo='grb --onto'
alias grboh='grbo head'
alias grbom='grbo master'
alias grbs='grb --skip'
alias grbu='grb upstream/master'
alias grl='g log --walk-reflogs --boundary --pretty=format:"%cd %h %gd %gs"'
alias grlp='grl --patch'
alias grm='g rm'
alias grs.='grs .'
alias grs='g reset'
alias grs^='grs head^'
alias grsh='grs --hard'
alias grsm='grs master'
alias grsp='grs --patch'
alias grv='g revert'
alias gs.='gs .'
alias gs='g status --short' # --branch
alias gsh.='gsh .'
alias gsh='g show'
alias gshis='gsh --ignore-all-space'
alias gshs.='gshs .'
alias gshs='gsh --stat'
alias gshss='gsh --shortstat'
alias gshw='gsh --color-words'
alias gst='g stash'
alias gstD='gst drop'
alias gsti='gst --include-untracked'
alias gstk='gst --keep-index'
alias gstl='gst list'
alias gstlp='gstl --patch'
alias gstp='gst pop'
alias gsts='gst save'
alias gstsh='gst show -p'
alias gstshs='gst show'
alias gstu='gst -u'
alias gt='g tag'
alias gta='gt --annotate'
alias gtd='gt --delete'
alias gtl='gt --list -n'
