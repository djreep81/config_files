#!/bin/bash

for configFileName in ".tmux.conf" ".tmux_lt_2_1.conf" ".tmux_ge_2_1.conf" ".tmux-status.conf" ".vimrc" ".inputrc" ".bashrc_common" ".promptline.sh"; do
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
