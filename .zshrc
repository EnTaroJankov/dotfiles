# The following lines were added by compinstall
zstyle :compinstall filename '/home/jankov/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install

# Startof custom alias added by jankov

# dotfiles setup inspired by https://news.ycombinator.com/item?id=11071754
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
