# see here for docs https://github.com/robbyrussell/oh-my-zsh/wiki/Design

# Colors
FRAMECOLOR='{002}'
FONTCOLOR='{214}'
HIGHLIGHTCOLOR='{045}'
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
ZSH_THEME_GIT_PROMPT_CLEAN='%f%F'${FRAMECOLOR}'✓%f'
#ZSH_THEME_GIT_PROMPT_DIRTY='%f%F'${PROMPTCOLOR}'✗%f'

ZSH_THEME_GIT_PROMPT_ADDED='%f%F'${HIGHLIGHTCOLOR}'✚%f'
ZSH_THEME_GIT_PROMPT_MODIFIED='%f%F'${HIGHLIGHTCOLOR}'✹%f'
ZSH_THEME_GIT_PROMPT_DELETED='%f%F'${HIGHLIGHTCOLOR}'✖%f'
ZSH_THEME_GIT_PROMPT_RENAMED='%f%F'${HIGHLIGHTCOLOR}'➜%f'
ZSH_THEME_GIT_PROMPT_UNMERGED='%f%F'${HIGHLIGHTCOLOR}'═%f'
ZSH_THEME_GIT_PROMPT_UNTRACKED='%f%F'${HIGHLIGHTCOLOR}'✭%f'

precmd() {

  # Get CWD
  CURRENTDIR='%~'
  CURRENTDIR=${CURRENTDIR: -${BOX0_LENGTH}}
  DIRECTORY=${CURRENTDIR}

  if [[ $(git_prompt_info) ]]
  then
    ZSH_THEME_GIT_PROMPT_PREFIX='%f%F'${FRAMECOLOR}'[%f%F'${HIGHLIGHTCOLOR}'git:%f%F'${FONTCOLOR}
    GIT_CLOSE_BRACKET=${CLOSE_BRACKET}
  else
    ZSH_THEME_GIT_PROMPT_PREFIX='%f%F'${FRAMECOLOR}'[%f%F'${FONTCOLOR}'git:'
    GIT_CLOSE_BRACKET=""
  fi

  MATCH='Adam'
  HOSTNAME=$HOST
  if [[ "$HOSTNAME" =~ $MATCH ]]
  then
    MACHINE='%m'
  else
    # Highlight remote machines to be more noticeable
    MACHINE='%f%F'${HIGHLIGHTCOLOR}'%m%f'
  fi

  # Get DATETIME
  DATETIME='%D{%F %X}'
  DATE='%D{%F}'
  TIME='%D{%X}'

  # Avengers Assemble
  LINE1=${UPPER_CORNER}${OPEN_BRACKET}${DATE}${CONNECT_BRACKET}${MACHINE}${CONNECT_BRACKET}${DIRECTORY}${CLOSE_BRACKET}'$(git_prompt_info)$(git_prompt_status)'${GIT_CLOSE_BRACKET}
  LINE2=${LOWER_CORNER}${OPEN_BRACKET}${TIME}${CLOSE_BRACKET}${CLI_PROMPT}

# Apparently this is the only way to get newlines into the prompt
PROMPT="
${LINE1}
${LINE2}"
}
