# shortcuts
alias ll="ls -laFG"
alias flushdns="dscacheutil -flushcache"
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias artisan="php artisan"
alias d="bundle exec derecho"

# daily routines 
function good() {
  if [ "$1" == "morning" ]; then
    echo "";
    echo "  GOOD MORNING YOU ASSHOLE!"
    echo "";
    brew up && brew upgrade && brew cleanup && sudo npm update -g && sudo gem update && brew doctor;
  elif [ "$1" == "night" ]; then
    echo "";
    echo "  NO! Your face is a good night!";
    echo "";
  fi
}

# $1 should be the file to recursively remove
function rmr() { 
  if [ $# == 1 ]; then
    find . -name $1 -exec rm -rf {} \;;
  else
    echo "";
    echo "  Recursively delete a file in your cwd."
    echo "";
    echo "  rmr [filename]";
    echo "";
  fi
}

function chmod-web-recursive {
  if [ $# == 1 ]; then
    for i in `find $1 -type d`; do  chmod 755 $i; done
    for i in `find $1 -type f`; do  chmod 644 $i; done
  else
    echo "";
    echo "  Chmod a root folder and all children to web ready permissions.";
    echo "";
    echo "  chmod-web-recursive [root folder]";
    echo "";
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
function ssh-key-copy() { 
  if [ $# == 2 ]; then
    cat ~/.ssh/id_rsa.pub | ssh $1 "mkdir ~/.ssh ; cat - >> ~/.ssh/authorized_keys";
  elif [ $# == 1 ]; then
    cat $1 | ssh $2 "mkdir ~/.ssh; cat - >> ~/.ssh/authorized_keys";
  else
    echo "";
    echo "  Copy your ssh key to the authorized_keys file on a remote server.";
    echo "";
    echo "  ssh-key-copy [user@address]           - copies ~/.ssh/id_rsa.pub to a remote server";
    echo "  ssh-key-copy [keyfile] [user@address] - copies the file you specify to a remote server";
    echo "";
  fi
}

# my grep
function mgrep() {
  if [ $# == 1 ]; then
    grep -irl $1 .;
  else
    echo "";
    echo "  My Grep, adds -irl to the normal grep command."
    echo "";
    echo "  mgrep [shit]";
    echo "";
  fi
}

# change the prompt to jgreen@server:/directory$ 
export PS1="\u@\h:\w$ "

# Increases the open file descriptor limit, helps avoid errors when 
# running watch processes on a large number of files
ulimit -n 1024

# include rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL

# autocompletion
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
source ~/.git-completion.bash
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

