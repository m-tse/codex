PROMPT='%F{178}%~ %F{52}> %f'

# History Settings
HISTFILESIZE=100000
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt appendhistory # Append history to the history file (no overwriting)
setopt sharehistory # Share history across terminals
setopt EXTENDED_HISTORY # record timestamp of each command
setopt HIST_FIND_NO_DUPS # Ignore duplicates when finding old commands
setopt HIST_IGNORE_ALL_DUPS # Erase duplicates in history file
# Immediately append to the history file, not just when a term is killed.
# Enabling this would create a bit of a tradeoff. It means if I have window
# A and B open, if I do a command in A, and up-arrow in B, I would get A's
# command, which is bad. The thing we want is for window B's commands to
# be available in history search for window A if window B stays open forever.
# Currently this is disabled.
# setopt incappendhistory

# -i adds timestamps to history
# 0 grabs the history from the first entry
alias history="history -i 0"

# Enable git completion
autoload -Uz compinit && compinit -i

# Put the git branch info on the right side
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=%F{82}\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '⎇ %b'
