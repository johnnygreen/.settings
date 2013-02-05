# shortcuts
alias ll="ls -laFG"
alias flushdns="dscacheutil -flushcache"
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias artisan="php artisan"

# daily routines 
function good() {
  if [ "$1" == "morning" ]; then
    brew up && brew upgrade && brew cleanup && sudo npm update -g && sudo gem update && brew doctor;
  elif [ "$1" == "night" ]; then
    echo "go fuck yourself";
  fi
}

# $1 should be the file to recursively remove
function rmr() { 
  if [ $# == 1 ]; then
    find . -name $1 -exec rm -rf {} \;;
  else
    echo "filename required";
  fi
}

function chmodwebr {
  if [ $# == 1 ]; then
    for i in `find $1 -type d`; do  chmod 755 $i; done
    for i in `find $1 -type f`; do  chmod 644 $i; done
  else
    echo "file or folder required";
  fi
}

##############################
# 1 argument
# $1 is remote server address
#
# 2 arguments 
# $1 is local file
# $2 is remove server address
##############################
function sshkeycopy() { 
  if [ $# == 2 ]; then
    cat ~/.ssh/id_rsa.pub | ssh $1 "mkdir ~/.ssh ; cat - >> ~/.ssh/authorized_keys";
  elif [ $# == 1 ]; then
    cat $1 | ssh $2 "mkdir ~/.ssh; cat - >> ~/.ssh/authorized_keys";
  else
    echo "remote server address required";
  fi
}

# my grep
function mgrep() {
  if [ $# == 1 ]; then
    grep -irl $1 .;
  else
    echo "search term required";
  fi
}

# change the prompt to jgreen@server:/directory$ 
export PS1="\u@\h:\w$ "

# add autocompletion for git commands
source ~/.git-completion.bash

# Increases the open file descriptor limit, helps avoid errors when 
# running watch processes on a large number of files
ulimit -n 1024

# include rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
