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
alias yum_sec='sudo yum --security check-update'
alias yum_secu='sudo yum --security update'
alias yum3='sudo yum list updates rpm yum bash firefox sudo git gcc'
alias yum3u='sudo yum update rpm yum bash firefox sudo git gcc'
alias yum4='sudo yum list updates curl gnome-* make python* java* perl'
alias yum4u='sudo yum update curl gnome-* make python* java* perl'
alias yum5='sudo yum list updates adobe* flash* ntop perl vim* wget xclip tar'
alias yum5u='sudo yum update adobe* flash* ntop perl vim* wget xclip tar'
alias yum6='sudo yum list updates httpd httpd-* selinux-*'
alias yum6u='sudo yum update httpd httpd-* selinux-*'
alias yuml="sudo yum list updates"
# exit
alias q='read -p "Press any key to exit, <C>c to stay " && exit'
alias ZZ='read -p "Press any key to exit, <C>c to stay " && exit'
