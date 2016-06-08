#COMMAND LINE#
##############
function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  unset timer
}

function exitstatus {

    EXITSTATUS="$?"
    BOLD="\[\033[1m\]"
    RED="\[\033[1;31m\]"
    GREEN="\[\e[32;1m\]"
    BLUE="\[\e[34;1m\]"
    LIGHTGREEN="\e[92m\]"
    OFF="\[\033[m\]"

    PROMPT="\n(\T) $(pwd) "
    AFTERPROMPT="\n${BOLD}${LIGHTGREEN}\$${OFF} "

    trap 'timer_start' DEBUG

    if [ "$PROMPT_COMMAND" == "" ]; then
      PROMPT_COMMAND="timer_stop"
    else
      PROMPT_COMMAND="$PROMPT_COMMAND; timer_stop"
    fi

    if [ "${EXITSTATUS}" -eq 0 ]
    then
      STATUSCOLOR="${GREEN}"
    else
      STATUSCOLOR="${RED}"
    fi

    # Get clean name of last command
    local LAST_COMMAND="$(history 1)"
    LAST_COMMAND=${LAST_COMMAND:7}

    PS1="${PROMPT}${BOLD}${STATUSCOLOR}${LAST_COMMAND}:${EXITSTATUS}:${timer_show}${OFF}${AFTERPROMPT}"
    PS2="${BOLD}>${OFF} "
}

PROMPT_COMMAND=exitstatus


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

## PATH VARS
# BASICS
PATH="/usr/local/mysql/bin:${PATH}"
PATH="/usr/bin:${PATH}"
PATH="/bin:${PATH}"
PATH="/usr/sbin:${PATH}"
PATH="/sbin:${PATH}"
PATH="/usr/local/bin:${PATH}"
PATH="/usr/local/mysql/bin:${PATH}"
# PYTHON
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

## NVM
export NVM_DIR="/Users/againsley/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
