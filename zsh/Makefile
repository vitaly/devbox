default: install
.PHONY: default


OHZSH := ~/.oh-my-zsh
${OHZSH}:
	git clone --depth=1 --branch local https://github.com/vitaly/oh-my-zsh $@

ohzsh: ${OHZSH}
	ln -sfn ${OHZSH} ~/.zsh
	# XXX remove ZFILES links
	ln -sfn .zsh/zshrc ~/.zshrc

PREZTO := ~/.zprezto
${PREZTO}:
	git clone --recursive https://github.com/sorin-ionescu/prezto $@
ZFILES := zlogin zlogout zpreztorc zprofile zshenv zshrc
prezto: ${PREZTO}
	ln -sfn ${PREZTO} ~/.zsh
	for f in ${ZFILES}; do ln -sfnv .zsh/runcoms/$$f ~/.$$f; done

chsh:
	# XXX echo `which zsh` | sudo tee -a /etc/shells
	# chsh -s `which zsh`

install: prezto chsh
.PHONY: install

update: ~/.zshrc
	cd ~/.zsh/ && git pull origin local
.PHONY: update
