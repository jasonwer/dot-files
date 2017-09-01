#
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Alias definitions.
source ~/.aliases/commands.sh
source_directory ~/.aliases
source_if_exists ~/.bash_aliases

# Search your history
bind "\C-p":history-search-backward
bind "\C-n":history-search-forward
bind "set bell-style none" # No bell, because it's damn annoying
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

# history (bigger size, no duplicates, always append):
export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTIGNORE="history*:fg:bg:vim"
export HISTTIMEFORMAT="%d/%m/%y %T "
shopt -s histappend
shopt -s checkwinsize # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

if [ `uname -s` == 'Linux' ]; then
  source_if_exists ./etc/bash_completion
else # I guess this is Mac OS/X
  source_if_exists /opt/local/etc/bash_completion
fi
source_directory ~/.bash_completion.d
source_if_exists ~/.bash_prompt

# Haskell binaries on the path please
[ -d ~/Library/Haskell/bin ] && PATH=$PATH:~/Library/Haskell/bin
[ -d ~/.local/bin ] && PATH=$PATH:~/.local/bin

# Export all the things we've set up above
export EDITOR=vim
export LANG=en_AU.UTF-8 # Setup the LANG so that gcc doesn't spit a^ characters instead of '

# Allow gistit to post gists as jasonwer
export GISTIT_TOKEN="34d2059b940f20149bc984c0694ff9778bf2f125"
