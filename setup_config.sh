#!/bin/bash

for configFileName in ".tmux.conf" ".vimrc" ".inputrc"; do
	echo "~/${configFileName}"
	if [[ -f ~/${configFileName} ]]; then
		echo -e "rm ~/$configFileName"
		rm ~/$configFileName
	else
		echo -e "~/${configFileName} does not exist"
	fi
	echo -e "ln -s $PWD/${configFileName} $HOME/${configFileName}"
	ln -s $PWD/${configFileName} ~/${configFileName}
done
