Configuration Repo
==================
Various configuration files and docs. Main purpose is to allow relatively quick
environment set up. Should generally work on OS X and Linux. Works on Windows
ConEmu + Git Bash.

## Getting started
> Assumes Git, Vim, and cURL are installed

1. git clone git@github.com:againsley/config.git
2. git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
2. cp config/bashrc.local .bashrc
2. cp config/bashrc.local .bash_profile
3. vimrcup
4. mkdir ~/.vimswap
4. sshup
5. vim config/bashrc
6. Add Machine specific commands to ~/.bashrc

* review for specifics on this machine

## All OS's
LastPass
Chrome
vim
Dropbox
Slack
Filezilla
Firefox
Forticlient
Spotify
Steam
Sublime Text2
Synergy
Adobe CC
MS Office
php
apache
MySQL
GoToMeeting

## OS X and Linux
git
iTerm2
Spectacle
Alfred
Skitch
BB Edit
Virtual Box
Fuse

## Win
ConEmu
Git Bash

## Config things to do
OSX: defaults write com.apple.finder AppleShowAllFiles YES
