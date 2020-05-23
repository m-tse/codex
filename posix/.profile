# Functions/settings shared by both zsh and bash that work across operating systems.

# Shortcut to diff your current branch against the merge point in the master branch.
gitdiffbranch() {
  git diff $(git merge-base --fork-point master)
}

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
