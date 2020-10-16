echo "howdy from ${0}"

export PATH="$HOME/workspace/osx-home/bin:$PATH"

export TERM='xterm-256color'

export LSCOLORS="GxFxCxDxBxEgEdabagacad"
alias ls='ls -G'
alias ll='ls -lah'

export GREP_OPTIONS="--color"

bindkey -e
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
export HISTCONTROL=erasedups
export HISTSIZE=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt append_history
setopt share_history

export XDG_CONFIG_HOME="${HOME}/.config"

export EDITOR="nvim"
alias vim=nvim

export GPG_TTY=$(tty)

autoload colors && colors
PS1="%{$fg[yellow]%}%n@%m %~ %{$reset_color%}%\> "

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias pracvim='gh gist edit 6f7338bc12924126ef0a60bb6a627be4 --filename practical_vim.md'
