#!/bin/bash

# make sure and install libX11-devel and libXt-devel on centos
git clone https://github.com/vim/vim.git

cd vim
git checkout tags/v8.1.0525

./configure \
  --disable-nls \
  --enable-cscope \
  --enable-gui=gtk2 \
  --enable-multibyte  \
  --enable-rubyinterp=yes \
  --enable-perlinterp=no \
  --enable-luainterp=yes \
  --enable-pythoninterp=yes \
  --with-python-config-dir=/usr/lib/python2.7/site-packages \
  --prefix=/home/wti/.local/vim \
  --with-features=huge  \
  --with-tlib=ncurses \
  --with-x

make && make install


cd -

git clone https://github.com/tmux/tmux.git

cd tmux
git checkout tags/2.8
./autogen.sh
./configure --prefix=/home/wti/.local/tmux
make && make install

wget https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/master/completions/tmux -O ~/.bash_completion.d/tmux
chmod a+x ~/.bash_completion.d/tmux

# show the bash completion files
# locate bash_completion
