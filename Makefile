install: backup
	@if [ ! -e  ~/.config/nvim ]; then mkdir -p \
				~/.config/nvim; fi
	@if [ ! -e  ~/.config/nvim/autoload ]; then mkdir -p \
				~/.config/nvim/autoload; fi
	@if [ ! -e  ~/.git_template/hooks ]; then mkdir -p \
				~/.git_template/hooks; fi
	@if [ ! -e  ~/.vimtemp/backup ]; then mkdir -p \
				~/.vimtemp/backup; fi
	@if [ ! -e  ~/.vimtemp/swap ]; then mkdir -p \
				~/.vimtemp/swap; fi
	@if [ ! -e  ~/.vimtemp/undo ]; then mkdir -p \
				~/.vimtemp/undo; fi
	@if [ ! -e  ~/.z ]; then mkdir -p \
				~/.z; fi
	@if [ ! -e  ~/.zsh ]; then mkdir -p \
				~/.zsh; fi
	@/bin/ln -sfv   ~/dotfiles/git_template/hooks/ctags \
							~/.git_template/hooks/ctags
	@/bin/ln -sfv   ~/dotfiles/git_template/hooks/post-checkout \
							~/.git_template/hooks/post-checkout
	@/bin/ln -sfv   ~/dotfiles/git_template/hooks/post-commit \
							~/.git_template/hooks/post-commit
	@/bin/ln -sfv   ~/dotfiles/git_template/hooks/post-merge \
							~/.git_template/hooks/post-merge
	@/bin/ln -sfv   ~/dotfiles/git_template/hooks/post-rewrite \
							~/.git_template/hooks/post-rewrite
	@/bin/ln -sfv   ~/dotfiles/gitconfig \
							~/.gitconfig
	@/bin/ln -sfv   ~/dotfiles/config/nvim/init.vim \
							~/.config/nvim/init.vim
	@/bin/ln -sfv   ~/dotfiles/config/nvim/autoload/plug.vim \
							~/.config/nvim/autoload/plug.vim
	@/bin/ln -sfv   ~/dotfiles/tmux.conf \
							~/.tmux.conf
	@/bin/ln -sfv   ~/dotfiles/vimrc \
							~/.vimrc
	@/bin/ln -sfv   ~/dotfiles/zshrc \
							~/.zshrc
	@/bin/ln -sfv   ~/dotfiles/ctags \
							~/.ctags

backup:
	@if [ ! -e  ~/dotfiles/backups/config/nvim/autoload ]; then mkdir -p \
				~/dotfiles/backups/config/nvim/autoload; fi
	@if [ -e            ~/.config/nvim/autoload/plug.vim ]; then /bin/cp -nv \
						~/.config/nvim/autoload/plug.vim \
		~/dotfiles/backups/config/nvim/autoload/plug.vim; fi
	@if [ -e            ~/.config/nvim/init.vim ]; then /bin/cp -nv \
						~/.config/nvim/init.vim \
		~/dotfiles/backups/config/nvim/init.vim; fi
	@if [ -e            ~/.gitconfig ]; then /bin/cp -nv \
						~/.gitconfig \
		~/dotfiles/backups/gitconfig; fi
	@if [ -e            ~/.tmux.conf ]; then /bin/cp -nv \
						~/.tmux.conf \
		~/dotfiles/backups/tmux.conf; fi
	@if [ -e            ~/.vimrc ]; then /bin/cp -nv \
						~/.vimrc \
		~/dotfiles/backups/vimrc; fi
	@if [ -e            ~/.zshrc ]; then /bin/cp -nv \
						~/.zshrc \
		~/dotfiles/backups/zshrc; fi
	@if [ -e            ~/.ctags ]; then /bin/cp -nv \
						~/.ctags \
		~/dotfiles/backups/ctags; fi

deletebackups:
	rm -rfv ~/dotfiles/backups

deleteoriginals:
	@if [ -e    ~/.config/nvim/autoload/plug.vim ]; then rm -v \
				~/.config/nvim/autoload/plug.vim; fi
	@if [ -e    ~/.config/nvim/init.vim ]; then rm -v \
				~/.config/nvim/init.vim; fi
	@if [ -e    ~/.gitconfig ]; then rm -v \
				~/.gitconfig; fi
	@if [ -e    ~/.tmux.conf ]; then rm -v \
				~/.tmux.conf; fi
	@if [ -e    ~/.vimrc ]; then rm -v \
				~/.vimrc; fi
	@if [ -e    ~/.zshrc ]; then rm -v \
				~/.zshrc; fi
	@if [ -e    ~/.ctags ]; then rm -v \
				~/.ctags; fi

