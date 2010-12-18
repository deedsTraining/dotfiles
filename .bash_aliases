# ~/.bash_aliases

alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'
alias ls="BLOCK_SIZE=\'1 ls --color=auto" #enable thousands grouping and colour
alias ll='ls -l --group-directories-first'
alias la='ls -la --group-directories-first'
alias cp='cp -i'
alias copy='cp -i'
alias mv='mv -i'
alias move='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias dir='ls -l | more'
alias cd..='cd ..'
alias cdl='cd; clear'
alias cls='clear'
alias clr='clear'
alias r='fc -s'
alias path='echo $PATH'
alias cd~='cd ~'
# for easy access to xclip (eg: ls -l | xclip)
alias xclip='xclip -selection c'
# disk usage at current level
alias du1='du --max-depth=1'
# bash
alias bashrc='gvim ~/.bashrc && source ~/.bashrc'
alias bashhi='gvim ~/.bash_history'
alias bashal='gvim ~/.bash_aliases && source ~/.bash_aliases'
alias hi="history"
# yum
alias ys='yum --security check-update'
alias ysu='sudo yum --security update'
alias y3='yum list updates rpm yum bash firefox sudo git gcc'
alias y3u='sudo yum update rpm yum bash firefox sudo git gcc'
alias y4='yum list updates curl gnome-* make python* java* perl'
alias y4u='sudo yum update curl gnome-* make python* java* perl'
alias y5='yum list updates adobe* flash* ntop perl vim* wget xclip tar'
alias y5u='sudo yum update adobe* flash* ntop perl vim* wget xclip tar'
alias y6='yum list updates httpd httpd-* selinux-* openssl openssl-*'
alias y6u='sudo yum update httpd httpd-* selinux-* openssl openssl-*'
alias yl="yum list updates"

function yum-help() {
  echo "Yum Custom Aliases Usage"
  echo
  echo "  ys	  = yum --security check-update"                             
  echo "  ysu   = sudo yum --security update"                                
  echo "  y3 	  = yum list updates set3"                               
  echo "  y4    = yum list updates set4"                               
  echo "  y5	  = yum list updates set5"                               
  echo "  y6    = yum list updates set6"
  echo "  y3u   = sudo yum update set3"
  echo "  y4u   = sudo yum update set4"
  echo "  y5u   = sudo yum update set5"
  echo "  y6u   = sudo yum update set6"
  echo "  yl    = yum list updates"
  echo
}

# exit
alias q='read -p "Press any key to exit, <C>c to stay " && exit'
alias ZZ='read -p "Press any key to exit, <C>c to stay " && exit'
