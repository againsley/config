# see here for docs https://github.com/robbyrussell/oh-my-zsh/wiki/Design

# Colors
FONTCOLOR='{214}'
FRAMECOLOR='{002}'
REMOTEFONT='{192}'
REPOCOLOR='{045}'
PROMPTCOLOR='{196}'
BOLD="\[\033[1m\]"
OFF="\[\033[m\]"

# Other Constants
BOX0_LENGTH=25

# These show the brackets between info and toggle colors
# [
OPEN_BRACKET='%F'${FRAMECOLOR}'[%f%F'${FONTCOLOR}
# ]
CLOSE_BRACKET='%f%F'${FRAMECOLOR}']%f'
# ][
CONNECT_BRACKET='%f%F'${FRAMECOLOR}'][%f%F'${FONTCOLOR}
# =>
CLI_PROMPT='%f%F'${PROMPTCOLOR}'%%> %f'

#UPPER_CORNER='%F'${FRAMECOLOR}'┌ $f'
#LOWER_CORNER='%F'${FRAMECOLOR}'└ $f'
UPPER_CORNER='%F'${FRAMECOLOR}':$f'
LOWER_CORNER='%F'${FRAMECOLOR}':$f'

# Get GIT
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_CLEAN='%f%F'${FRAMECOLOR}'✓%f'${CLOSE_BRACKET}
ZSH_THEME_GIT_PROMPT_DIRTY='%f%F'${PROMPTCOLOR}'✗%f'${CLOSE_BRACKET}
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE='%fF'${PROMPTCOLOR}

precmd() {

  # Get CWD
  CURRENTDIR='%~'
  CURRENTDIR=${CURRENTDIR: -${BOX0_LENGTH}}

  if [[ $(git_prompt_info) ]]
  then
    # highlight repo dirs to be more noticeable
    DIRECTORY='%f%F'${REPOCOLOR}${CURRENTDIR}'%f'

    ZSH_THEME_GIT_PROMPT_PREFIX='%f%F'${FRAMECOLOR}'[%f%F'${REPOCOLOR}'git:%f%F'${FONTCOLOR}
  else
    DIRECTORY=${CURRENTDIR}
    ZSH_THEME_GIT_PROMPT_PREFIX='%f%F'${FRAMECOLOR}'[%f%F'${FONTCOLOR}'git:'
  fi

  MATCH='Adam'
  HOSTNAME=$HOST
  if [[ "$HOSTNAME" =~ $MATCH ]]
  then
    MACHINE='%m'
  else
    # Highlight remote machines to be more noticeable
    MACHINE='%f%F'${REMOTEFONT}'%m%f'
  fi

  # Get DATETIME
  DATETIME='%D{%F %X}'
  DATE='%D{%F}'
  TIME='%D{%X}'

  # Avengers Assemble
  LINE1=${UPPER_CORNER}${OPEN_BRACKET}${DATE}${CONNECT_BRACKET}${MACHINE}${CONNECT_BRACKET}${DIRECTORY}${CLOSE_BRACKET}'$(git_prompt_info)'
  LINE2=${LOWER_CORNER}${OPEN_BRACKET}${TIME}${CLOSE_BRACKET}${CLI_PROMPT}

# Apparently this is the only way to get newlines into the prompt
PROMPT="
${LINE1}
${LINE2}"
}
