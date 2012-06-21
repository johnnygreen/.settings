alias ll="ls -laFG"
alias flushdns="dscacheutil -flushcache"
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

function rmr() { find . -name '$1' -exec rm -rf {} \;; }

function sshkeycopy() { 
  if [ -z "$2" ]
  then
    cat ~/.ssh/id_rsa.pub | ssh $1 "mkdir ~/.ssh ; cat - >> ~/.ssh/authorized_keys";
  else
    cat $1 | ssh $2 "mkdir ~/.ssh; cat - >> ~/.ssh/authorized_keys";
  fi
}

export PS1="\u@\h:\w$ "

source ~/.git-completion.bash
