#!/bin/bash

for configFileName in ".tmux.conf" ".tmux-status.conf" ".vimrc" ".inputrc" ".bashrc_common" ".promptline.sh" "alacritty.yml"; do
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

alacritty_dir=".config/alacritty/"
alacritty_file="alacritty.yml"
if [[ -f ~/${alacritty_dir}${alacritty_file} ]]; then
        echo -e "rm ~/${alacritty_dir}${alacritty_file}"
        rm ~/${alacritty_dir}${alacritty_file}
else
        echo -e "~/${alacritty_dir}${alacritty_file} does not exist"
fi
echo -e "mkdir -p $HOME/${alacritty_dir}"
mkdir -p $HOME/${alacritty_dir}
echo -e "ln -s $PWD/${alacritty_file} $HOME/${alacritty_dir}${alacritty_file}"
ln -s $PWD/${alacritty_file} $HOME/${alacritty_dir}${alacritty_file}
