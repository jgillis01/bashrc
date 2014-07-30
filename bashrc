# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Set vi mode for shell
set -o vi

export EDITOR=vim

export PROMPT_COMMAND=''

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# append to the history file, don't overwrite it
shopt -s histappend

# For fat fingers
shopt -s cdspell
shopt -s dirspell

# PS1 definition
source $HOME/bash/prompt.sh

# Alias definitions
for i in $(ls $HOME/bash/aliases); do source "$HOME/bash/aliases/$i"; done

# ENV variables
for i in $(ls $HOME/bash/variables); do source "$HOME/bash/variables/$i"; done

# Update PATH
PATH=$HOME/local/bin:/usr/local/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export CDPATH=$HOME/Development
