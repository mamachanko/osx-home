#!/usr/bin/env bash

set -o pipefail

main() {
  configure_bash
  configure_kitty
  configure_fuzzyfinder
  configure_direnv
}

configure_bash() {
  configure_env
  configure_aliases
  configure_prompt
  configure_keys
}

configure_env() {
  source ~/vendor/bash/colours.bash
  source ~/vendor/bash/git-completion.bash

  LANG=en_US.UTF-8
  EDITOR=nvim
  LESS=-Ri

  # Do not immediately quit the shell on C-d, but only after the third time.
  IGNOREEOF=2

  # Include my scripts in PATH. I keep my script in ~/bin.
  PATH="$HOME/workspace/osx-home/bin:$HOME/go/bin:$PATH"

  # Set TERM='xterm-256color' get proper color support in Vim and other
  # applications.
  TERM='xterm-256color'

  # This erases duplicates in the command history, keeps 10k entris, and
  # appends to the history file rather than overwriting it.
  HISTCONTROL=ignoredups:erasedups
  HISTSIZE=10000
  PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
  shopt -s histappend

  LSCOLORS="GxFxCxDxBxEgEdabagacad"
  GREP_OPTIONS="--color"
}

configure_aliases() {
  alias vim=nvim
  alias ls='ls -Glah'
  alias ll='ls'
}

configure_prompt() {
  source $(which prompt)
}

configure_keys() {
  # Configure up/down arrow keys to search through history.
  bind '"\e[A": history-search-backward'
  bind '"\e[B": history-search-forward'
  bind '"\eOA": history-search-backward'
  bind '"\eOB": history-search-forward'
}

configure_direnv() {
  eval "$(direnv hook bash)"
}

configure_kitty() {
  source /dev/stdin <<<"$(kitty + complete setup bash)"
}

configure_fuzzyfinder() {
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash
}

main

