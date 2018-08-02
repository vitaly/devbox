default: docker
.PHONY: default

help:
	@echo make vim
	@echo make zsh
	@echo make git
	@echo make docker
.PHONY: help

vim:
	${MAKE} -C vim
.PHONY: vim

zsh:
	${MAKE} -C zsh
.PHONY: zsh

git:
	${MAKE} -C git
.PHONY: git

docker:
	${MAKE} -C docker
.PHONY: docker
