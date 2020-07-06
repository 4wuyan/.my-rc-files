[ -z "$PS1" ] && return  # If not running interactively, don't do anything

# ------------
# General
# ------------

shopt -s checkwinsize  # check the window size after each command and,
    # if necessary, update the values of LINES and COLUMNS.
stty -ixon  # Free Ctrl-S for forward-i-search
shopt -s globstar  # enable **


# ------------
# History
# ------------
HISTCONTROL=ignoreboth  # don't put duplicate lines or lines starting with space
shopt -s histappend  # append to the history file, don't overwrite it
HISTSIZE=10000
HISTFILESIZE=100000


# ------------
# Aliases
# ------------

alias g='git status'

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'

alias v='vim'


# ------------
# Completion
# ------------

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


# ------------
# PS1
# ------------

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# ------------
# Colors
# ------------

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# ------------
# Ubuntu specific
# ------------

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
  # make less more friendly for non-text input files, see lesspipe(1)
