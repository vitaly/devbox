default: install
.PHONY: default

~/.zsh/zshrc:
	git clone --depth=1 --branch local https://github.com/vitaly/oh-my-zsh.git ~/.zsh

~/.zshrc: ~/.zsh/zshrc
	ln -sfn  $< $@

install: ~/.zshrc
	chsh -s `which zsh`
.PHONY: install

update: ~/.zshrc
	cd ~/.zsh/ && git pull origin local
.PHONY: update
