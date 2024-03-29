#!/bin/bash
# DEPRECATED: Use zsh instead.
# posix (os_x or linux) bash profile.
PROMPT_COMMAND=__prompt_command
__prompt_command() {
  local NORMAL_COLOR='\[\e[0m\]'
  local RED='\[\e[0;31m\]'
  local YELLOW='\[\e[0;33m\]'
  local GREY='\[\e[0;37m\]'
  local GREEN='\[\e[0;92m\]'
  local USER='\u'
  local BASENAME='\W'
  PS1="\n${RED}${USER}${NORMAL_COLOR}|${YELLOW}${BASENAME}${GREEN}$(__git_ps1)${NORMAL_COLOR} → "
}

export LSCOLORS="dxfxBxDxbxHxHxBxxghxhx"
export CLICOLOR=1
export EDITOR=vim
export HISTTIMEFORMAT="%y/%m/%d %T "
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
