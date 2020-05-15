# My own custom bash settings
# Add "source %file%" or ". %file%" in .bashrc

# alias
alias vi='vim'
alias ls='ls --color=auto'

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\W\[\033[92m\]\$(parse_git_branch)\[\033[00m\] $ "

# Git autocomplete
if [ -f /etc/bash_completion.d/git ]; then
    source /etc/bash_completion.d/git
elif [ -f /usr/share/bash-completion/completions/git ]; then
    . /usr/share/bash-completion/completions/git
fi

stty -ixon  # Free Ctrl-S for forward-i-search
