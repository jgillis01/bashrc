#!/usr/bin/env bash

RESET="$(tput sgr0)"
BOLD="$(tput bold)"
DIM="$(tput dim)"

GREY="$(tput setaf 0)"
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
PURPLE="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"

ORANGE="$(tput setaf 214)"
ARROW=$(echo -e '\u27a1')
STAR=$(echo -e '\u2605')
HAZARD=$(echo -e '\u2623')

# Bash counts the number of characters that get printed (in PS1) so that it can correctly 
# redraw when you scroll through your history. That's why bash has the \[ and \] special 
# characters - they tell bash that the enclosed characters are not printable, which helps 
# bash figure out how to redraw the prompt when necessary.

# Command substitution should be in single quotes.  This prevents expansion at assignment time.
# If command substitution was in double quotes or unquoted, the output of a command would be
# captured once at assignment and remain static.
# In order to support variable values that change over time, the shell expands the value of PS1 
# each time the prompt is displayed. This means that expansion should be prevented at assignment 
# time by quoting. It also means that you need to be careful about speed: if the command 
# substitution takes 1 second to complete, then your prompt will take 1 second to display.

# Taken from http://unix.stackexchange.com/questions/31642/bash-prompt-command-messing-up-scroll-history-display

source ~/bash/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1
PS1='\n\[${BOLD}\]\[${ORANGE}\]\h \[${BLUE}\]\w\n\[${RESET}\]$(__git_ps1 "(%s) ")\[${RESET}\]\[${RED}\]${ARROW}\[${RESET}\] '
