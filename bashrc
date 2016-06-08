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
# Moved to ~/config/sshconfig

## SSH PEACH
# Moved to ~/config/sshconfig

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

# CONFIG UPDATES
alias vimrcup='cp ~/config/vimrc ~/.vimrc'
alias sshup='cp ~/config/sshrc ~/.ssh/config'

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
