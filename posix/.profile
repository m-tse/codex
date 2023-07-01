# Functions/settings shared by both zsh and bash that work across operating systems.

gcm() {
  git checkout master
}

gc() {
  git checkout "$@"
}

gp() {
  git pull
}

# Shortcut to diff your current branch against the merge point in the master branch.
gitdiffbranch() {
  git diff $(git merge-base --fork-point master)
}
alias gdb='gitdiffbranch'

# Shortcut to list the files changed in your current branch against the merge point in the master branch.
gitdiffbranchfiles() {
  git diff --name-only $(git merge-base --fork-point master)
}
alias gdbf='gitdiffbranchfiles'

# Rebase the current branch off the merge point in the master branch and autosquash any fixup commits.
# Set the GIT_EDITOR to true to automatically accept the changes, then set it back to normal.
gitrebase() {
  export GIT_EDITOR=true;
  git rebase --interactive --autosquash $(git merge-base --fork-point master);
  export GIT_EDITOR=vim;
}

# Quickly add all files and commit with a fixup message based off the last commit, which will be autosquashed
gitcommit() {
  git commit --all -m "fixup! $(git rev-parse HEAD)"
}

# Combine gitcommit, gitrebase, and git force push into one command.
gitupdate() {
  gitcommit
  gitrebase
  git push -f
}

# When doing an interactive rebase and needing to resolve conflicts, after conflicts are resolved,
# run this command to add all dirty files and auto-accept the rebase commit contents.
gitrebasecontinue() {
  git add .
  export GIT_EDITOR=true;
  git rebase --continue
  export GIT_EDITOR=vim;
}
alias grc='gitrebasecontinue'

grim() {
  git rebase -i master
}

# Delete a branch
gbd() {
  git branch -D $1
}

shell() {
  # Run something as another user without assuming that user in an interactive shell
  USER="$1"
  ARGS="${@:2}"
  sudo -u $USER zsh -c "$ARGS"
}

# Set default editors to vim
export EDITOR=vim
export VISUAL=vim
export GIT_EDITOR=vim

# See http://www.bigsoft.co.uk/blog/2008/04/11/configuring-ls_colors for a detailed explanation

# This is for BSD implementation of ls, used in macOS
# Use colors for file types with ls
export CLICOLOR=1
# Use a friendlier ls color scheme for a dark background
export LSCOLORS=dxgxhxhxbxhxhxbxbxhxhx

# This is for GNU implementation of ls, used in linux and putty. Note `ls --color=auto` is required.
export LS_COLORS="di=00;33:ln=00;36:ex=00;31:ow=00;31"

function ls() {
  # -A lists dotfiles, and is compatible between mac and linux
  command ls -A --color=always "$@"
}

function grep() {
  command grep --color=always "$@"
}

function less() {
  command less -R "$@"
}

# Colored man settings
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;31m'
