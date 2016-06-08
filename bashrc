#COMMAND LINE#
##############

# Set up command timing
function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  unset timer
}


# Run the timer
trap 'timer_start' DEBUG
PROMPT_COMMAND="$PROMPT_COMMAND; timer_stop"

# read/write history immediatly
PROMPT_COMMAND="history -a; history -r; $PROMPT_COMMAND"


function __prompt_command() {

  # Get last command status
  # Apparantly this has to happen first
  EXITSTATUS="$?"

  # Font styles
  DATECOLOR="\[\033[38;5;105m\]"
  STATUSCOLOR="\[\033[38;5;96m\]"
  CWDCOLOR="\[\033[38;5;52m\]"
  PROMPTCOLOR="\[\033[38;5;208m\]"
  CPUCOLOR="\[\033[38;5;21m\]"
  BOLD="\[\033[1m\]"
  OFF="\[\033[m\]"

  # Status colors
  SUCCESS="\[\033[38;5;70m\]"
  FAILURE="\[\033[38;5;196m\]"

  # Get clean name of last command
  LAST_COMMAND="$(history 1)"
  LAST_COMMAND=${LAST_COMMAND:7}
  LAST_COMMAND="$(echo -e "${LAST_COMMAND}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

  # Get status returned by last command
  if [ "${EXITSTATUS}" -eq 0 ]
  then
    RESPONSECOLOR="${STATUSCOLOR}"
  else
    RESPONSECOLOR="${FAILURE}"
  fi

  # Get CPU
  CPUPERCENT=$(ps -A -o %cpu | awk '{s+=$1} END {print s "%"}')

  # Set prompt parts
  DATE="[${DATECOLOR}"'\D{%F %T}'"${OFF}]"
  STATUS="[${STATUSCOLOR}${LAST_COMMAND}:${RESPONSECOLOR}${EXITSTATUS}${STATUSCOLOR}:"'${timer_show}s'"${OFF}]"
  CPU="[${CPUCOLOR}CPU:${CPUPERCENT}${OFF}]"
  CWD="[${CWDCOLOR}$(pwd)${OFF}]"
  PROMPT="%> "

  # Donezo
  PS1="\n${DATE}${STATUS}${CWD}${CPU}\n${PROMPT}"

}

# export the prompt
export PROMPT_COMMAND="__prompt_command; $PROMPT_COMMAND"

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
