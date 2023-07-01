# Enable 256 colors (might not be necessary on mac, but required for putty)
export TERM=screen-256color

# Display an empty character instead of a '%' to indicate EOL when cat-ing a file.
PROMPT_EOL_MARK=''

# Add last command exit code if not zero
function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  local EXIT_CODE_PROMPT=''
  if [[ $LAST_EXIT_CODE -eq 0 ]]; then
    EXIT_CODE_PROMPT+="%F{7}"
  else
    EXIT_CODE_PROMPT+="%F{1}"
  fi
  EXIT_CODE_PROMPT+="$LAST_EXIT_CODE%{$reset_color%}"
  EXIT_CODE_PROMPT+=""
  echo "$EXIT_CODE_PROMPT"
}

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' unstagedstr '~'
zstyle ':vcs_info:git:*' formats '%u%c%F{2}%b'

function host_color() {
  if [[ "$HOST" =~ .*"prd".* ]]; then
    echo "9" # Bold Red
  elif [[ "$HOST" =~ .*"qa".* ]]; then
    echo "5" # Purple
  elif [[ "$HOST" =~ .*"dev".* ]]; then
    echo "11" # Bold Yellow
  else
    echo "4" # Blue
  fi
}

PROMPT=$'%F{3}|%D{%H:%M:%S}| %F{13}\\$\?=$(check_last_exit_code) %F{5}\$vcs_info_msg_0_ \n%F{$(host_color)}%m:%F{14}%~ %F{3}> %f'

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

# Enable auto completion, and use a cache so zsh is still responsive.
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# Only focus on the auto complete menu when there are more than 3 entries.
zstyle ':completion:*' menu select=3
# Install a standard set of colors for zsh autocomplete.
zstyle ':completion:*' list-colors ''
# Upon second tab of auto complete, automatically select and tab through the options.
setopt auto_menu

# Prevents "zsh: command not found: #"
setopt INTERACTIVE_COMMENTS

# Turn on full fuzzy path completion
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

# Turn on fish-style autosuggestions
source ~/.submodules/zsh-autosuggestions/zsh-autosuggestions.zsh

# Turn on zsh highlighting
source ~/.submodules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Enable the bracket highlighter in addition to main one. Others don't do anything.
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow,bold'

# Turn on history substring search
source ~/.submodules/zsh-history-substring-search/zsh-history-substring-search.zsh
HISTORY_SUBSTRING_SEARCH_FUZZY='yes'

# Source non ZSH specific configuration
source ~/.profile

# Source any machine specific local configuration, but don't error if not found
source ~/.local_profile 2>/dev/null

# See https://stackoverflow.com/questions/23128353/zsh-shortcut-ctrl-a-not-working
# This is needed to restore ctrl+a/ctrl+e functionality after setting EDITOR/VISUAL=vim in ~/.profile
bindkey -e
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
