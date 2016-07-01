# File: .bashrc
# Maintainer: HacDan(David McClellan)

export CLICOLOR=1
export TERM="xterm-256color"

# Bash History Options
export HISTSIZE=1000
export HISTCONTROL=ignoreboth
export HISTIGNORE='&:ls:[bf]g:exit'
shopt -s histappend

# Git Alias for managing dotfiles
# Sourced from: https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias config='/usr/bin/git --git-dir=/home/dmcclellan/.cfg/ --work-tree=/home/dmcclellan'
alias config='/usr/bin/git --git-dir=/home/dmcclellan/.cfg/ --work-tree=/home/dmcclellan'
alias config='/usr/bin/git --git-dir=/home/dmcclellan/.cfg/ --work-tree=/home/dmcclellan'

# Set VIM as our editor
export EDITOR=vim

shopt -s checkwinsize

# Autocomplete without case, because shift is hard.
shopt -s cdspell

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Set code working directory
export CODE=$HOME/code
alias cdcode='cd $CODE'

# Aliases
alias la='ls -alh'
alias svim='sudo vim'
alias gcode='cd $HOME/code/go'
alias cdcode='cd $CODE'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Package Maintenance Aliases
alias update='sudo apt-get update'
alias upgrade='sudo apt-get dist-upgrade -y'
alias clean='sudo apt-get clean'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Go shell variables.
export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin
ulimit -n 8096
export PATH=$PATH:/usr/local/go/bin

# Make NVM play nicely
export NVM_DIR="/home/dmcclellan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Convenience Functions
mkcd() { mkdir -p "$@" && cd $_; }

# Playing with ze prompt
function __setprompt {
  local GREEN="\[\033[1;32m\]"
  local NO_COLOUR="\[\033[0m\]"
  local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
  local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
  if [ $SSH2_IP ] || [ $SSH_IP ] ; then
    local SSH_FLAG="@\h"
  fi
  PS1="$BLUE[\$(date +%H:%M)][\w]\\$ $NO_COLOUR"
  PS2="$BLUE>$NO_COLOUR "
  PS4='$BLUE+$NO_COLOUR '
}
__setprompt
