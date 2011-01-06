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
alias bashal='gvim ~/.bash_aliases && source ~/.bashrc'
alias hi="history"
alias resrc=". ~/.bashrc"
# yum
alias ys='yum --security check-update'
alias ysu='sudo yum --security update'
alias yl="yum list updates"
alias yu="sudo yum update"
alias yc="sudo yum clean all"

function yum-alias() {
  echo "Yum Custom Aliases Usage"
  echo
  echo "  ys	  = yum --security check-update"                             
  echo "  ysu   = sudo yum --security update"                                
  echo "  yl    = yum list updates"
  echo "  yu    = sudo yum update"
  echo "  yc    = sudo yum clean all"
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
alias q='read -p "Press any key to exit, <C>c to stay " && exit'
alias ZZ='read -p "Press any key to exit, <C>c to stay " && exit'
