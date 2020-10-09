#
# .bash_profile
#
# @author Vagiz Duseev
# @see .inputrc
#

export SHELL="bash"
export EDITOR="vim"
export VISUAL="vim"

# Use colors.
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.bash_aliases ]
then
  source ~/.bash_aliases
fi

# Include function file (if present)
if [ -f ~/.bash_functions ]
then
  source ~/.bash_functions
fi

# Nicer prompt.
# \d - current day of the week
# \t - current time in 24h format
# \u - current user
# \h - hostname
# \w - current working directory
## Definition of promt colors
## https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
LIGHT_GREEN="\[\e[1;32m\]"
YELLOW="\[\e[1;33m\]"
RED="\[\e[0;31m\]"
LIGHT_BLUE="\[\e[1;34m\]"
LIGHT_GRAY="\[\e[0;37m\]"
LIGHT_CYAN="\[\e[1;36m\]"
NC="\[\e[0m\]" # no color

## Definition of promt segments
__BASH_PROMT_LOGO="\[\]" 
__BASH_PROMT_DATETIME="${LIGHT_GREEN}\t (\d)"
__BASH_PROMT_USER_LOCATION="${YELLOW}\u ${RED}on ${LIGHT_BLUE}\h ${RED}at ${LIGHT_GRAY}\w"
__BASH_PROMT_GIT="${LIGHT_CYAN}\$(git branch 2>/dev/null | sed -n 's/* \(.*\)/\1 /p')"
__BASH_PROMT_SYMBOL="$"
if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
  __BASH_PROMT_SSH="[SSH] "
fi

## Definition of rows
__BASH_PROMT_ROW_1="${NC}┌─${__BASH_PROMT_SSH}${__BASH_PROMT_DATETIME} ${__BASH_PROMT_USER_LOCATION} ${__BASH_PROMT_GIT}"
__BASH_PROMT_ROW_2="${NC}└─${__BASH_PROMT_SYMBOL} "

# Definition of the whole promt
export PS1="${__BASH_PROMT_ROW_1}\n${__BASH_PROMT_ROW_2}"
