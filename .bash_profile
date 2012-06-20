alias ll="ls -laFG"
alias flushdns="dscacheutil -flushcache"
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias artisan="php artisan"
alias composer="php composer.phar"

export PS1="\u@\h:\w$ "
source ~/.git-completion.bash

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"