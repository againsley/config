#  ----------------------------------------------------------------------------
#  Description: This file holds all my BASH configurations and aliases
#
#  Sections:
#  0.  oh-my-zsh
#  1.  Prompt
#  2.  Environment
#  3.  Aliases
#  4.  File and Folder Management
#  5.  Searching
#  6.  Process Management
#  7.  Networking
#  8.  System Operations & Information
#  9.  Web Development
#  10. Config Repo Mgmt
#  11. Initialize
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
#  0.  OH-MY-ZSH
# -----------------------------------------------------------------------------

  # OMZ HOMEPAGE
  # https://github.com/robbyrussell/oh-my-zsh/wiki

  # Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh


# -----------------------------------------------------------------------------
#  1.  PROMPT
# -----------------------------------------------------------------------------

  # Set name of the theme to load.
  # Look in ~/.oh-my-zsh/themes/
  ZSH_THEME="adamg"

# -----------------------------------------------------------------------------
#  2.  ENVIRONMENT
# -----------------------------------------------------------------------------

  # _ and - will be interchangeable (sensitive completion must be off
  HYPHEN_INSENSITIVE="true"

  # Timestamps on history output
  HIST_STAMPS="yyyy-mm-dd"

  # Uncomment the following line to disable colors in ls.
  # have to do this otherwise theme-and-appearance.zsh breaks
  DISABLE_LS_COLORS="true"

  # Would you like to use another custom folder than $ZSH/custom?
  # ZSH_CUSTOM=/path/to/new-custom-folder

  # Plugins folder: ~/.oh-my-zsh/plugins/*
  # Custom plugins folder: ~/.oh-my-zsh/custom/plugins/
  # Example format: plugins=(rails git textmate ruby lighthouse)
  # Add wisely, as too many plugins slow down shell startup.
  # plugins=(git)

  # Set Paths
  PATH="/bin:${PATH}"
  PATH="/sbin:${PATH}"
  PATH="/usr/bin:${PATH}"
  PATH="/usr/local:${PATH}"
  PATH="/usr/local/mysql/bin:${PATH}"
  PATH="/usr/sbin:${PATH}"

  # Add Python
  PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
  export PATH

  # NVM
  export NVM_DIR="/Users/againsley/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# -----------------------------------------------------------------------------
# 3.  Aliases
# -----------------------------------------------------------------------------
  . ./config/aliases
  . ./config/functions
  # zsh Specific aliases
  # TODO figure out why this always calls on zsh init
  # alias colors='for code in {000..255}; do print -P -- "$code: %F{$code}Test%f"; done'

# -----------------------------------------------------------------------------
# 11. Initialize
# -----------------------------------------------------------------------------

  # Base OMZ config
  source $ZSH/oh-my-zsh.sh

