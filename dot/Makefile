default: help
.PHONY: default

help:
	@echo make tmux
.PHONY: help

~/.dotfiles:
	git clone --depth 1 --branch local https://github.com/vitaly/dotfiles $@

~/.tmux.conf: ~/.dotfiles
	tmux new-session -s 'install' -c $</tmux -d make && tmux wait install-tmux

tmux: ~/.tmux.conf
.PHONY: tmux
