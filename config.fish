#!/usr/bin/env fish

if test $TERM != "xterm-kitty"
	set -x TERM "xterm-256color"
end

set -x PAGER (which most > /dev/null && echo most; or echo less)
set -x EDITOR (which nvim > /dev/null && echo nvim; or which vim > /dev/null && echo vim; or echo nano)

# load ssh agent info
source ~/.ssh/ssh-agent-vars.fish

# load gpg agent
set -x GPG_TTY (tty)
gpgconf --launch gpg-agent > /dev/null

# Keybindings

bind \cH backward-kill-word
bind \e\[3\;5~ kill-word
