export PATH="$PATH:/usr/local/bin"
export PATH=/opt/homebrew/bin:$PATH

# added by travis gem
[ -f /Users/christianbroberg/.travis/travis.sh ] && source /Users/christianbroberg/.travis/travis.sh

# Added by cb for TextMate
export EDITOR="/usr/local/bin/mate -w"

# hosts aliases

alias dns1='ssh dns1.webhouse.net'
alias dns2='ssh dns2.webhouse.net'

alias amidala='ssh amidala.webhouse.net'
alias skywalker='ssh skywalker.webhouse.net'
alias kenobi='ssh kenobi.webhouse.net'
alias dj='ssh dj.webhouse.net'
alias kanata='ssh kanata.webhouse.net'
alias hive='ssh hive.senti.cloud'

alias solo='ssh solo.webhouse.net'

alias jabba='ssh jabba.webhouse.net'
alias vader='ssh vader.webhouse.net'

alias sky='ssh skywalker.webhouse.net'

# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# dir change aliases
alias apps='cd ~/Apps/'
alias play='cd ~/Apps/play'
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias desktop='cd ~/Desktop'
alias gapps='cd Google\ Drive\ \(cb@webhouse.dk\)/Apps/'


# Misc aliases
alias flushdns='sudo killall -HUP mDNSResponder; sleep 2; echo macOS DNS Cache Flushed | say'
alias pwgen='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome "http://passwd.webhouse.dk/index.php?action=create&numchars=15&numpasswords=10&makePronounceable=1&makeAlphanumeric=1&useChars=" && CLEAR'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# http://bashrcgenerator.com/

export PS1="\[\033[38;5;3m\]\u@\[$(tput sgr0)\]\[\033[38;5;13m\]\h\[$(tput sgr0)\]\[\033[38;5;2m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]> \[$(tput sgr0)\]"
export CLICOLOR=1
export LSCOLORS=cxfxcxdxbxegedabagacad


# added by travis gem
[ -f /Users/cb/.travis/travis.sh ] && source /Users/cb/.travis/travis.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
