install: backup
	@/bin/ln -sfv ~/dotfiles/vimrc     ~/.vimrc
	@if [ ! -e ~/.config/nvim ]; then mkdir -p ~/.config/nvim; fi
	@if [ ! -e ~/.config/nvim/autoload ]; then mkdir -p ~/.config/nvim/autoload; fi
	@if [ ! -e ~/.vimtemp/undo ]; then mkdir -p ~/.vimtemp/undo; fi
	@if [ ! -e ~/.vimtemp/swap ]; then mkdir -p ~/.vimtemp/swap; fi
	@if [ ! -e ~/.vimtemp/backup ]; then mkdir -p ~/.vimtemp/backup; fi
	@if [ ! -e ~/.zsh ]; then mkdir ~/.zsh; fi
	@if [ ! -e ~/.z ]; then mkdir ~/.z; fi
	@/bin/ln -sfv ~/dotfiles/zshrc     ~/.zshrc
	@/bin/ln -sfv ~/dotfiles/tmux.conf ~/.tmux.conf
	@/bin/ln -sfv ~/dotfiles/init.vim  ~/.config/nvim/init.vim
	@/bin/ln -sfv ~/dotfiles/plug.vim  ~/.config/nvim/autoload/plug.vim

backup:
	@if [ ! -e ~/dotfiles/backups ]; then mkdir -p ~/dotfiles/backups; fi
	@if [ -e ~/.vimrc ]; then /bin/cp -nv ~/.vimrc ~/dotfiles/backups/vimrc; fi
	@if [ -e ~/.zshrc ]; then /bin/cp -nv ~/.zshrc ~/dotfiles/backups/zshrc; fi
	@if [ -e ~/.tmux.conf ];then /bin/cp -nv ~/.tmux.conf ~/dotfiles/backups/tmux.conf; fi
	@if [ -e ~/.config/nvim/init.vim ];then /bin/cp -nv ~/.config/nvim/init.vim ~/dotfiles/init.vim; fi
	@if [ -e ~/.config/nvim/autoload/plug.vim ];then /bin/cp -nv ~/.config/nvim/init.vim ~/dotfiles/autoload/plug.vim; fi

deletebackups:
	rm -rfv ~/dotfiles/backups

deleteoriginals:
	@if [ -e ~/.vimrc ]; then rm -v ~/.vimrc; fi
	@if [ -e ~/.zshrc ]; then rm -v ~/.zshrc; fi
	@if [ -e ~/.tmux.conf ]; then rm -v ~/.tmux.conf; fi
	@if [ -e ~/.config/nvim/init.vim ]; then rm -v ~/.config/nvim/init.vim; fi
	@if [ -e ~/.config/nvim/autoload/plug.vim ]; then rm -v ~/.config/nvim/autoload/plug.vim; fi

