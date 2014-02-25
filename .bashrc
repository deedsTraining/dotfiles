#!/bin/bash
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
#variables
export WORK=/home/rod/work/
export EDITOR=gvim
export CDROM=/mnt/cdrom
export PATH=$PATH:/home/rod/.gem/ruby/1.8/bin:/usr/lib/ruby/1.8/:/home/rod/texlive/2012/bin/i386-linux
export TERM="xterm-256color"
export INPUTRC="~/.inputrc"
#history
HISTCONTROL=ignoreboth:ignoredups
HISTIGNORE="&:[bf]g:exit:l[sl.d]:hi:history:pwd:cd[~/.]:cd..:q:ZZ:bashrc:bashhi;bashal:[ ]*;[ \t]*;hi *;hg *"
#shopt
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
# mark completion
_completemarks() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$(find $MARKPATH -type l -printf "%f\n")
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}
complete -F _completemarks jump unmark
