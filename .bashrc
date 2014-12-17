#
# ~/.bashrc: executed by bash(1) for non-login shells.
#
# Called by ~/.profile when the bash version environment variable exists
#
# Author: Jonathan Skowera
#
# Currenty configured with JAVA_HOME for Oracle JDK 7
#

##################################################
# Environment Variables

export PATH=$PATH:\
$HOME/bin:\
$HOME/node_modules/.bin:\
$HOME/src/gocode/bin:\
$HOME/opt/android-studio/bin:\
$HOME/opt/android-studio/sdk/tools:\
$HOME/opt/sbison/bin:\
$HOME/opt/sflex/bin

extrapath=' \
bin \
node_modules/.bin \
src/gocode/bin \
opt/android/studio/bin \
opt/android-studio/sdk/tools \
opt/sbison/bin \
opt/sflex/bin \
'

for dn in $extrapath; do
  if [ -e "$HOME/$extrapath" ]; then
    export PATH="$PATH:$HOME/$dn"
  fi
done

extrasource=' \
opt/google-cloud-sdk/path.bash.inc \
opt/google-cloud-sdk/completion.bash.inc \
'

for fn in $extrasource; do
  if [ -e "$HOME/$fn" ]; then
    source "$HOME/$fn"
  fi
done

export GOPATH=$HOME/src/gocode

export JAVA_HOME=/usr/lib/jvm/oracle-jdk1.7.0_67

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

