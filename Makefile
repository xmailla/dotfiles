MAKEFLAGS += --silent

GH_URL = https://github.com/xmailla

SHELL := $(shell command -v zsh 2> /dev/null)
# .DEFAULT_SHELL := command -v zsh 2> /dev/null)
.ONESHELL:
STOW_OPTS := --target=$$HOME --verbose=1

TARGETS := all brew-bundle brew-install clean docker-build docker-shell docker-ssh dotfiles hammerspoon help neovim shell stow targets-table test update-readme clean clean-docker clean-brew clean-py-pkgs
.PHONY: $(TARGETS)

all: help

install: ## Install dotfiles
	stow --verbose=1 --target=$$HOME --dotfiles .

uninstall: ## Uninstall dotfiles
	stow --verbose=1 --target=$$HOME --delete --dotfiles .
	$(info ==> uninstalled dotfiles)

pkgsrc-install: ## Install pkgsrc
	$(info Preparing to install Pkgsrc)
	/bin/bash -c "unset GIT_CONFIG;  $$(curl -fsSL $(HOMEBREW_URL)/install.sh)"

chsh: ## Set shell to ZSH
	echo "$$(which zsh)" | sudo tee -a /etc/shells
	chsh -s "$$(which zsh)" $$USER

rust-install:  ## Install rust & cargo
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

rust-pkgs: ## Install rust programs
	cargo install bat cargo-update exa topgrade

targets-table:
	printf "|Target|Descripton|\n|---|---|\n"
	grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "| %s| %s |\n", $$1, $$2}'

update-readme: ## Update Make targets table in README
	sed -i '' -e '/^|/d' README.md
	make targets-table | mdformat - >> README.md
help: ## Display all Makfile targets
	grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# vim: set fenc=utf8 ffs=unix ft=make foldmethod=indent list noet sw=4 ts=4 tw=100:
