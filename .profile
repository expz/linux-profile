# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash, then call .bashrc
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

##################################################
# Environment Variables

export PATH=$PATH:$HOME/src/gocode/bin:$HOME/opt/android-studio/bin

# The next line updates PATH for the Google Cloud SDK.
source '/home/user/opt/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/home/user/opt/google-cloud-sdk/completion.bash.inc'

export GOPATH=$HOME/src/gocode

#################################################

# If not running interactively, don't do anything else
[ -z "$PS1" ] && return

#################################################
# Nothing below executed for non-interactive prompts!!!


#################################################
# Shell Options

# Set prompt
#  \e[0m anywhere => Makes the newline not work
PS1="\u@\h:\w > "

# Make the * match hidden files
shopt -s dotglob

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

########## History

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=100000

##################################################
# Command: less

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

##################################################
# Command: ls, grep, apt-get install

# Colors
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls -A --color=auto --group-directories-first'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Aliases
alias ll='ls -AlF'
alias la='ls -A'
alias ii='sudo apt-get install'

##################################################
# XWindows Options

# Remap CAPS_LOCK to SUPER (Mac/Windows Key)
# WARNING: This changes the XWindows key mapping in all applications
#cat | xmodmap - <<DELIM
#remove Lock = Caps_Lock
#remove mod3 = Super_L
#keysym 0x42 = Super_L
#add mod3 = Super_L
#DELIM

#xmodmap -e "clear Lock" -e "keycode 0x42 = Super_L"

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;\u@\h:\w\]"
#    ;;
#*)
#    ;;
#esac

