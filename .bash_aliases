# ~/.bash_aliases

alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'
# list
alias ls="BLOCK_SIZE=\'1 ls --color=auto" #enable thousands grouping and colour
alias ll='ls -l --group-directories-first'
alias la='ls -la --group-directories-first'
alias dir='ls -l | more'
# copy/move
alias cp='cp -i'
alias copy='cp -i'
alias mv='mv -i'
alias move='mv -i'
# remove
alias rm='rm -i'
alias del='rm -rf' # remove directory/ies recursively 
# new directory
alias mkdir='mkdir -p'
# cd
alias cd..='cd ..'
alias cdl='cd; clear'
alias cd~='cd ~'
alias ..="cd ../"
alias ...="cd ../.."
alias ....="cd ../../.."
# clear screen
alias cls='clear'
alias clr='clear'
# re-execute last command begins with ...
alias r='fc -s'
# variables
alias path='echo $PATH'
alias e=$EDITOR
# for easy access to xclip (eg: ls -l | xclip)
alias xclip='xclip -selection c'
# disk usage at current level
alias du1='du --max-depth=1'
# bash
alias bashrc='gvim ~/.bashrc && source ~/.bashrc'
alias bashhi='gvim ~/.bash_history'
alias bashal='gvim ~/.bash_aliases && source ~/.bashrc'
alias hi="history"
alias resrc=". ~/.bashrc;echo 'bashrc sourced'"
# yum
alias ys='yum --security check-update'
alias ysu='sudo yum -y -v --security update'
alias yl="yum list updates"
alias yu="sudo yum -y -v update"
alias yc="sudo yum -v clean all"
alias yi="yum info "

function yum-alias() {
  echo "Yum Custom Aliases Usage"
  echo
  echo "  ys	  = yum --security check-update"                             
  echo "  ysu   = sudo yum -y -v --security update"                                
  echo "  yl    = yum list updates"
  echo "  yu    = sudo yum -y -v update"
  echo "  yc    = sudo yum -v clean all"
  echo "  yi    = yum info ?"
 echo
}

# rpm
# installed packages with their contents
alias rpmq='rpm -qa -l --qf "%{NAME}:\n" | less'
# installed by size, biggest last
alias rpmqs='rpm -qa --queryformat "%{SIZE}  %{NAME}-%{VERSION}-%{RELEASE}\n" | sort -n'
# function to query changelog for a package
rpmqc () { rpm -q --changelog "$1" | less;}

function rpm-alias() {
  echo "RPM Custom Aliases Usage"
  echo
  echo "  rpmq = rpm -qa -l --qf '%{NAME}:\n' | less"                             
  echo "  rpmqs = rpm -qa --qf '%{SIZE}   %{NAME .. \n | sort -n'"                                
  echo "  rpmqc = rpm -q --changelog '$1' | less"                               
  echo
}

# exit
alias q='read -p "Press enter to exit, <C>c to stay " && exit'
alias ZZ='read -p "Press enter to exit, <C>c to stay " && exit'
