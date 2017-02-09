Codex
======================
Codex of all the tweaks, commands, and configurations for the technology stacks I've run across.


Customize bash prompt.  Lots more info [here](https://www.ibm.com/developerworks/linux/library/l-tip-prompt/) and [here](http://apple.stackexchange.com/questions/9821/can-i-make-my-mac-os-x-terminal-color-items-according-to-syntax-like-the-ubuntu).  Current settings are (#username: #Directory) with red username and yellow directory
`export PS1='\[\e[0;31m\]\u\[\e[0m\]:\[\e[0;33m\] \W\[\e[0m\]\$ '`


#### Get letters/keys to repeat properly.

When holding down a letter, OS X will give you options, like `a` with several different accents.  Type this in terminal to get all keys to repeat upon press/hold
`defaults write -g ApplePressAndHoldEnabled -bool false`

#### iTerm2

Go to Settings -> keyboard, and check use option as meta key

Choose Homebrew theme because it looks the best.

I'm using Menlo Size 11 font right now.

In Startup -> New windows open with: Same Settings , underneatth Same Working Directory


#### Environmental/PATH settings
OS-X will look in the following locations, first to last for PATH settings
```
/etc/profile
~/.bash_profile
~/.bash_login   (if .bash_profile does not exist)
~/.profile      (if .bash_login does not exist)
```
So I recommend putting new path variables in the `/.bash_profile` location

[Homebrew](http://mxcl.github.io/homebrew/)
--------
Package manager like Ubuntu's apt-get.  I like homebrew much better than MacPorts, it's faster and more intuitive.  Macports will download/install all dependencies from scratch.  While Homebrew will use preinstalled apple dependencies when possible.  Homebrew will also put apps in /usr/local/bin, which is wayyyy more intuitive than macports /opt/local.  Ultimately I want a grab and go package manager, that does as much as possible for me leaving me to code.

install via the website's latest instructions

`brew search (string)` to search for a package

`brew install (packagename)` to isntall


Filemerge
-------------
Great visual diff/merge tool that comes with OS-X, looks more modern than the other tools.

Might need to modify the symbolic link so opendiff -> filemerge

#### Work With Mercurial

Create a script called fmdiff.  Its contents are
```
#!/bin/sh
# opendiff returns immediately, without waiting for FileMerge to exit.
# Piping the output makes opendiff wait for FileMerge.
opendiff "$@" | cat
```

Make the script executable via: `chmod 755 fmdiff`

Modify your .hgrc file to include:
```
[extdiff]
cmd.fmdiff = /usr/local/bin/fmdiff

[merge-tools]
filemerge.executable = /usr/local/bin/fmdiff
filemerge.args = $local $other -ancestor $base -merge $output
```

#### Work with Git

modify the `~/.gitconfig` file to include:
```
[diff]
        tool = opendiff
        prompt = false
```

make sure opendiff is in the path

run it using the command `git difftool -d`