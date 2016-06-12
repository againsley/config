# Set up the prompt
autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# If we have a glob this will expand it case insensitive
setopt GLOB_COMPLETE
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT
setopt EXTENDED_GLOB

# only fools wouldn't do this ;-)
setopt VI
export EDITOR="vi"

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)" # doesn't seem to work on Mac
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' ignore-parents parent pwd

# generate descriptions with magic.
zstyle ':completion:*' auto-description 'specify: %d'

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Aliases
alias g='egrep --color -inr'
alias clera='clear'
alias cls='clear'
alias cear='clear'
alias clea='clear'
alias lear='clear'
alias claer='clear'
alias clea='clear'

alias ll='ls --color -la'
#alias ls='pwd; ls --color -FGlAhp'
alias ls='pwd; ls -FGlAhp'
alias l='ls --color -l'

alias st='git status'
alias gl='git log'
alias glp='git log -p'
alias gln='git log --name-only'

# Bash
alias bash='exec /bin/bash --login'
