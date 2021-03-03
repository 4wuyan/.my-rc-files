#!/usr/bin/env fish

# ln -s <this_file> ~/.config/fish/config.fish
# or in ~/.config/fish/config.fish
# source <this_file>

# Without --global, they'll be universal, and
# will persist in ~/.config/fish/fish_variables after they are removed here
abbr --add --global cp "cp --interactive"  # confirm if overwriting
abbr --add --global g 'git'
abbr --add --global gs 'git status'
abbr --add --global l 'ls -CF'
abbr --add --global mv "mv --interactive"  # confirm if overwriting
abbr --add --global v 'vim'
abbr --add --global vi 'vim'

#------------------
# Homebrew on Linux
#------------------
if [ -d /home/linuxbrew/.linuxbrew ]
	# eval (SHELL=fish /home/linuxbrew/.linuxbrew/bin/brew shellenv) is too slow!
	set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew";
	set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar";
	set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew";
	set -q PATH; or set PATH ''; set -gx PATH "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin" $PATH;
	set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/home/linuxbrew/.linuxbrew/share/man" $MANPATH;
	set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH;
end

#------------------
# Environment specific
#------------------

# WSL
if string match --quiet '*Microsoft' < /proc/sys/kernel/osrelease
	abbr --add --global p 'powershell.exe'
	set --export DOCKER_HOST 'tcp://localhost:2375'
	if [ (umask) = '0000' ]; umask 0022; end
end

# Dell laptop
if string match --quiet '*YWU*' < /proc/sys/kernel/hostname
	abbr --add --global s 'smerge.exe .'
	abbr --add --global gb '/c/Program\ Files/Git/bin/bash.exe'
	abbr --add --global ma '/c/Users/yan.wu/Music/wy-swiss-army-knife/make-aws/run'
	abbr --add --global tunnel 'powershell.exe /Users/yan.wu/Music/wy-swiss-army-knife/create-tunnel.ps1'
	function jira
		"/c/Program Files/Mozilla Firefox/firefox.exe" https://jira.iress.com/browse/IPSX-$argv
	end
end
