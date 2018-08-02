default: update
.PHONY: default

~/.vim:
	git clone --depth 1 --branch local https://github.com/vitaly/dotvim3.git ~/.vim

install: ~/.vim
	cd ~/.vim/ && make install
.PHONY: install

update: ~/.vim
	cd ~/.vim/ && git pull origin local
	cd ~/.vim/ && make install
.PHONY: update

upgrade: ~/.vim
