#! /bin/sh

git init --bare $HOME/.dots
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
dots config --git-dir=$HOME/.dots --local status.showUntrackedFiles no
#echo "alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'" >> $HOME/.zshrc
