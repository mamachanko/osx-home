#!/usr/bin/env bash

main() {
	configure_kitty
	configure_direnv
	configure_bash
}

configure_kitty() {
	source /dev/stdin <<<"$(kitty + complete setup bash)"
}

configure_bash() {
	configure_bash_env
	configure_fuzzyfinder
	configure_aliases
	configure_prompt
}

configure_bash_env() {
	source vendor/bash/*

	LANG=en_US.UTF-8
	EDITOR=vim
	LESS=-Ri

	# Include my scripts in PATH. I keep my script in ~/bin.
	PATH="$HOME/bin:$HOME/go/bin:$PATH"

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

	# Configure up/down arrow keys to search through history.
	bind '"\e[A": history-search-backward'
	bind '"\e[B": history-search-forward'
	bind '"\eOA": history-search-backward'
	bind '"\eOB": history-search-forward'
}

configure_fuzzyfinder() {
	[ -f ~/.fzf.bash ] && source ~/.fzf.bash
}

configure_aliases() {
	alias ls='ls -Glah'
	alias ll='ls'
	alias load_ssh='lpass login mbrauer@vmware.com && ssh-lpass-agent load -n "Personal/github_id_rsa"'
	alias pracvim='gh gist edit 6f7338bc12924126ef0a60bb6a627be4'
}

configure_prompt() {
	PS1="\[${YELLOW}\]\\w \[${GREEN}\]\`parse_git_branch\`>_ \[${RESET}\]"
}

parse_git_branch() {
	BRANCH=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	if [ ! "${BRANCH}" == "" ]; then
		STAT=$(parse_git_dirty)
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

parse_git_dirty() {
	status=$(git status 2>&1 | tee)
	dirty=$(
		echo -n "${status}" 2>/dev/null | grep "modified:" &>/dev/null
		echo "$?"
	)
	untracked=$(
		echo -n "${status}" 2>/dev/null | grep "Untracked files" &>/dev/null
		echo "$?"
	)
	ahead=$(
		echo -n "${status}" 2>/dev/null | grep "Your branch is ahead of" &>/dev/null
		echo "$?"
	)
	newfile=$(
		echo -n "${status}" 2>/dev/null | grep "new file:" &>/dev/null
		echo "$?"
	)
	renamed=$(
		echo -n "${status}" 2>/dev/null | grep "renamed:" &>/dev/null
		echo "$?"
	)
	deleted=$(
		echo -n "${status}" 2>/dev/null | grep "deleted:" &>/dev/null
		echo "$?"
	)
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

configure_direnv() {
	eval "$(direnv hook bash)"
}

main

