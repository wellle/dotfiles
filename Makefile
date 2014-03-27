install: backup
	/bin/ln -sfv ~/dotfiles/vimrc     ~/.vimrc
	/bin/ln -sfv ~/dotfiles/zshrc     ~/.zshrc
	/bin/ln -sfv ~/dotfiles/tmux.conf ~/.tmux.conf

backup:
	mkdir -p ~/dotfiles/backups
	@/bin/cp -nv ~/.vimrc     ~/dotfiles/backups/vimrc
	@/bin/cp -nv ~/.zshrc     ~/dotfiles/backups/zshrc
	@/bin/cp -nv ~/.tmux.conf ~/dotfiles/backups/tmux.conf

delete:
	rm -rfv ~/dotfiles/backups
