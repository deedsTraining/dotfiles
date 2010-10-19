# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source ~/.bash_aliases
source /etc/bash_completion

export WORK=/home/rod/work/
export EDITOR=gvim
export CDROM=/mnt/cdrom
#export PS1="\[\033[1;34m\][\u@\h\w]$\[\033[0m\] "
HISTCONTROL=ignoreboth:ignoredups
HISTIGNORE="&:[bf]g:exit:l[sl.d]:hi:history:pwd:cd[~/.]:cd .."

alias hi="history"
alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'
alias ls="BLOCK_SIZE=\'1 ls --color=auto" #enable thousands grouping and colour
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias dir='ls -l | more'
alias cd..='cd ..'
alias cdl='cd; clear'
alias cls='clear'
alias r='fc -s'
alias path='echo $PATH'
alias cd~='cd ~'
# for easy access to xclip (eg: ls -l | xclip)
alias xclip='xclip -selection c'
# disk usage at current level
alias du1='du --max-depth=1'
alias bashrc='gvim ~/.bashrc && source ~/.bashrc'
alias bashhi='gvim ~/.bash_history'
alias yum1='sudo yum --security check-update'
alias yum2='sudo yum --security update'
alias yum3='sudo yum list updates rpm yum bash firefox \
curl gnome-* make python* java* adobe* flash* ntop perl* \
vim* git xclip tar sudo'
shopt -s autocd
shopt -s dirspell
shopt -s cdspell
shopt -s checkwinsize
shopt -s histappend

# for git tab completion
source /etc/bash_completion.d/git

# git alias
alias gs="git status"
alias ga="git add"
alias gd="git diff"
alias gc="git commit"
alias gp="git push"
alias gb='git branch -a -v'

# git prompt
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
#export PS1='[\u@\h \W]$(__git_ps1 " (%s)")\\$ '
#export PS2='continue> '
#export PS3='choose: '
#export PS4='|${BASH_SOURCE} ${LINENO}${FUNCNAME[0]:+ ${FUNCNAME[0]}()}|  '

function elite
{
local GRAY="\[\033[1;30m\]"
local LIGHT_GRAY="\[\033[0;37m\]"
local CYAN="\[\033[0;36m\]"
local LIGHT_CYAN="\[\033[1;36m\]"
local NO_COLOUR="\[\033[0m\]"
case $TERM in
    xterm*|rxvt*)
        local TITLEBAR='\[\033]0;\u@\h:\w\007\]'
        ;;
    *)
        local TITLEBAR=""
        ;;
esac
local temp=$(tty)
local GRAD1=${temp:5}
PS1="$TITLEBAR\
$GRAY-$CYAN-$LIGHT_CYAN(\
$CYAN\u$GRAY@$CYAN\h\
$LIGHT_CYAN)$CYAN-$LIGHT_CYAN(\
$CYAN\#$GRAY/$CYAN$GRAD1\
$LIGHT_CYAN)$CYAN-$LIGHT_CYAN(\
$CYAN\$(date +%H%M)$GRAY/$CYAN\$(date +%d-%b-%y)\
$LIGHT_CYAN)$CYAN-$GRAY-\
$LIGHT_GRAY\n\
$GRAY-$CYAN-$LIGHT_CYAN(\
$CYAN\$$GRAY:$CYAN\w\
$LIGHT_CYAN)$CYAN-$GRAY-$LIGHT_GRAY " 
PS2="$LIGHT_CYAN-$CYAN-$GRAY-$NO_COLOUR "
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function prompt2 {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GREY="\[\033[0;37m\]"
  local      PURPLE="\[\033[0;35m\]"
  local      YELLOW="\[\033[0;33m\]"
  local       TEALB="\[\033[0;46m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}\
$YELLOW[$PURPLE\$(date +%H:%M)$YELLOW]\
$BLUE[$BLUE\u@\h:\w$GREEN\$(parse_git_branch)$BLUE]\
$LIGHT_GREY\$ "
PS2='> '
PS3='choose: '
PS4='+ '
}
prompt2


