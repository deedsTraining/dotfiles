#!/bin/bash
# apt-get
alias agi="sudo apt-get install "
alias agr="sudo apt-get remove "
alias acs="apt-cache search " #name of package
alias agu="sudo apt-get update && sudo apt-get upgrade"
alias aguc="sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean"
alias apt-get="sudo apt-get "
alias aguy="sudo apt-get --yes"
alias agp="sudo apt-get purge "
alias agpe="sudo apt-get remove --purge" 
alias agauto="sudo apt-get autoremove --purge" # clean up
alias agclean="sudo apt-get autoclean && sudo apt-get autoremove"
alias agup="sudo apt-get upgrade --show-upgraded"
alias agadd='sudo add-apt-repository'
agaddi () {
  if [ $1 ] && [ $2 ]; then
agadd $1 && _sau && _sai $2
  else
echo "need ppa AND package-name"
  fi
}
