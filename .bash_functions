#!/bin/bash
# .bash_functions
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
$YELLOW[$TEALB\$(date +%H:%M)$YELLOW]\
$YELLOW[$LIGHT_GREEN\u@\h:\w$LIGHT_GREEN\$(parse_git_branch)$YELLOW]\
$WHITE\$ "
PS2='> '
PS3='choose: '
PS4='+ '
}

function extract()      # Handy Extract Program.
{
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

function gmail()      # connect to gmail
{
curl -u roderick.alexander.mitchell@gmail.com --silent "https://mail.google.com/mail/feed/atom" | perl -ne
 ' print "Subject: $1 " if /<title>(.+?)<\/title>/ && $title++; 
   print "(from $1)\n" if /<email>(.+?)<\/email>/;'
}

function translate() 
{
 wget -qO- "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$1&langpair=${2:-en}|${3:-es}"   | sed -E -n 's/[[:alnum:]": {}]+"translatedText":"([^"]+)".*/\1/p';
echo ''
return 0;
}

function mcd () {
    mkdir "$@" && cd "$@"
}

function find_in_files()
{
  find $1 -type f -exec grep -l '$2' {} \; $3
}
