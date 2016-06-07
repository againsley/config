#COMMAND LINE#
##############
export PS1="[\T]\w% "

#ALIASES#
#########

# LS COMMANDS#
alias ls='ls -laFGh'

# NAVIGATION
alias ..='cd ..'
alias ...='cd ../..'
alias home='cd ~'

## SSH SPRINGFIELD
alias wtm='ssh adamg@dev.whentomanage.com'
alias staging='ssh root@54.224.89.190'
alias crons='ssh root@crons.whentomanage.com'
alias newcrons='ssh ubuntu@new-crons.whentomanage.com'
alias pos1='ssh root@54.227.33.115'
alias pos2='ssh root@54.89.200.23'

## SSH PEACH
alias peachdev='ssh adamg@dev.peachworks.com'
alias peachdb='ssh againsley@db-bastion.peachworks.com'

# CLEAR COMMANDS
alias clera='clear'
alias cls='clear'
alias cear='clear'
alias clea='clear'
alias lear='clear'
alias claer='clear'
alias clea='clear'

# OTHER COMMANDS
alias egrep='egrep -rin --color'


# COLOR SCHEME
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# PATH VARS
#export PATH="/usr/local/mysql/bin:$PATH"
export PATH=/usr/local/mysql/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/mysql/bin
export NVM_DIR="/Users/againsley/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Setting PATH for Python 3.4
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH
