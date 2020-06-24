# Enable 256 colors (might not be necessary on mac, but required for putty)
export TERM=screen-256color
# Set the left prompt to 'host:path $?= >' with colors
PROMPT='%F{27}%m:%F{178}%~ $(check_last_exit_code)%F{166}> %f'

# Add last command exit code if not zero
function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    local EXIT_CODE_PROMPT=''
    EXIT_CODE_PROMPT+="%F{8}\$?=%{$reset_color%}"
    EXIT_CODE_PROMPT+="%F{1}$LAST_EXIT_CODE%{$reset_color%}"
    EXIT_CODE_PROMPT+=" "
    echo "$EXIT_CODE_PROMPT"
  fi
}

# Use colors for file types with ls
export CLICOLOR=1

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

alias ls="ls -a"

# Enable auto completion, and use a cache so zsh is still responsive.
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# ZSH prompts to correct a mispelled command.
setopt correct_all

# Turn on full fuzzy path completion
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

# Put the git branch info on the right side
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=%F{82}\$vcs_info_msg_0_
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' unstagedstr '~'
zstyle ':vcs_info:git:*' formats '%u%c[%b]'


# Add the timestamp to the right side after the git branch info.
RPROMPT=$RPROMPT' %F{178}%D{%H:%M:%S}'

# Turn on fish-style autosuggestions, submodule must have been initialized.
source ~/Development/codex/posix/submodules/zsh-autosuggestions/zsh-autosuggestions.zsh

# Turn on zsh highlighting, submodule must have been initialized.
source ~/Development/codex/posix/submodules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Enable the bracket highlighter in addition to main one. Others don't to do anything.
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Turn on history substring search, submodule must have been initialized.
source ~/Development/codex/posix/submodules/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
