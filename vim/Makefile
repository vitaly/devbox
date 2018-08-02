default: install
.PHONY: default

~/.vim:
	git clone --depth 1 --branch local https://github.com/vitaly/dotvim3.git ~/.vim

~/.config/nvim/init.vim: nvim/init.vim
	mkdir -p ~/.config/nvim
	cp $< $@

install: ~/.vim ~/.config/nvim/init.vim
	cd ~/.vim/ && make install
.PHONY: install

update: ~/.vim  ~/.config/nvim/init.vim
	cd ~/.vim/ && git pull origin local
	cd ~/.vim/ && make install
.PHONY: update
