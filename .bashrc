# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#source ~/.bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#source ~/.bash_functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

export WORK=/home/rod/work/
export EDITOR=gvim
export CDROM=/mnt/cdrom
export PATH=$PATH:/home/rod/.gem/ruby/1.8/bin
export TERM="xterm-256color"
export INPUTRC="~/.inputrc"

HISTCONTROL=ignoreboth:ignoredups
HISTIGNORE="&:[bf]g:exit:l[sl.d]:hi:history:pwd:cd[~/.]:cd..:q:ZZ:bashrc:bashhi;bashal:[ ]*"

shopt -s autocd
shopt -s dirspell
shopt -s cdspell
shopt -s checkwinsize
shopt -s histappend

# git completion
#source /etc/bash_completion.d/git
source ~/.git.completion.bash

# git aliases
source ~/.git.aliases.bash

#rails aliases
#source ~/.rails.aliases.bash

#gem completion
source ~/.gem.completion.bash

#gem aliases
source ~/.gem.aliases.bash

# git prompt
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
#export PS1='[\u@\h \W]$(__git_ps1 " (%s)")\\$ '
#export PS2='continue> '
#export PS3='choose: '
#export PS4='|${BASH_SOURCE} ${LINENO}${FUNCNAME[0]:+ ${FUNCNAME[0]}()}|  '
