#!/usr/bin/env fish

# Files and directories and shit

set -xg LISTER (which exa > /dev/null && echo 'exa -F --group-directories-first'; or echo 'ls -h')

alias l $LISTER' -1'
alias ll $LISTER' -l'
alias la $LISTER' -la'

function cd
	set OLDPWD $PWD
	builtin cd $argv
	eval $LISTER
end

function mkd
	mkdir -p $argv
	cd $argv[1]
end

function r
	ranger --choosedir=rdir.tmp
	set -x OLDPWD $PWD
	cd (cat rdir.tmp)
	rm $OLDPWD'/rdir.tmp'
end

# Editing stuff

alias v $EDITOR
alias sv 'sudo '$EDITOR

# General tools

alias g 'geany'
alias o 'rifle'
alias please 'sudo'
alias ip 'ip -c'

alias findgrep 'grep -rni'
alias f 'find . -iname'
alias lspack 'aunpack -l'
alias unpack 'aunpack -x'
alias cbi 'xclip -sel clip -i'
alias cbo 'xclip -sel clip -o'

function mywatch
	while true
		clear
		date
		echo "Command: '"$argv"'"
		printf '%*s\n' $COLUMNS '' | tr ' ' -
		eval $argv
		printf '%*s\n' $COLUMNS '' | tr ' ' -
		sleep 1
	end
end

# Special tools

alias clock 'mywatch "date +%T | figlet | cowsay -n | lolcat"'
alias dirt 'watch grep -e "Dirty" -e "Writeback" /proc/meminfo'

function codelines
	grep -E "\w" $argv | wc -l
end

function burn
	sudo dd if=$argv[1] of=$argv[2] status=progress conv=fsync
end

function dunst-pause
	notify-send 'Pausing dunst'
	notify-send DUNST_COMMAND_PAUSE
	notify-send 'Dunst paused'
end

function dunst-resume
	notify-send 'Resuming dunst'
	notify-send DUNST_COMMAND_RESUME
	notify-send 'Dunst resumed'
end

# Package management

function up
	which eopkg > /dev/null && sudo eopkg up $argv; or which apt > /dev/null && sudo apt update && sudo apt upgrade $argv; or echo "no packet manager found"
end

function it
	which eopkg > /dev/null && sudo eopkg it $argv; or which apt > /dev/null && sudo apt install $argv; or echo "no packet manager found"
end

function eosr
	eopkg sr $argv | grep -v "devel" | grep -v "dbginfo" || true
end

function sr
	which eopkg > /dev/null && eosr $argv; or which apt-cache > /dev/null && apt-cache search $argv; or echo "no packet manager found"
end

# ssh

alias mal-tunnel 'ssh -L 8080:192.168.177.254:80 -L 8090:192.168.177.253:80 -L 9080:192.168.71.254:80 -L 9090:192.168.71.253:80 -L 8443:192.168.177.1:443 mal-office'
alias ft-tunnel 'ssh -L 8080:192.168.13.1:80 -L 8090:192.168.13.254:80 -L 8022:192.168.13.2:22 fasttube'

# git

alias ga 'git add'
alias gaa 'git add --all'
alias gst 'git status'
alias gc 'git commit -v'
alias gca 'git commit -va'
alias gc! 'git commit -v --amend'
alias gca! 'git commit -va --amend'
alias gco 'git checkout'
alias gcb 'git checkout -b'
alias gcl 'git clone --recursive'
alias gd 'git diff'
alias gf 'git fetch'
alias gfa 'git fetch --all --prune'
alias gfo 'git fetch origin'
alias gm 'git merge'
alias gp 'git push'
alias gpf 'git push -f'
alias gl 'git pull'
alias gr 'git remote'
alias grb 'git rebase'
alias grbi 'git rebase -i'
alias grh 'git reset'
alias grhh 'git rebase --hard'
alias gb 'git branch'
alias gbd 'git branch -d'
alias gbl 'git blame -bw'
alias glg 'git log --stat'
