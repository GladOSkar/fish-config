#!/usr/bin/env fish

if test $TERM != "xterm-kitty"
	set -x TERM "xterm-256color"
end

# load ssh agent info
source ~/.ssh/ssh-agent-vars.fish

# load gpg agent
set -x GPG_TTY (tty)
gpgconf --launch gpg-agent > /dev/null

# Keybindings

bind \eH backward-kill-word
bind \e\[3\;5~ kill-word
