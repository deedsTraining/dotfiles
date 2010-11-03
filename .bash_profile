# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
  echo "==> aliases loaded from profile";
fi

# User specific environment and startup programs
<<COMMENT
function parse_git_branch {
  ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

PS1="\w \$(parse_git_branch)\$ "
COMMENT

