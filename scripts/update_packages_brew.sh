#!/bin/bash

# install wezterm
brew tap wez/wezterm-linuxbrew
brew install wezterm

# enable undercurl support in wezterm
tempfile=$(mktemp) \
  && curl -o $tempfile https://raw.githubusercontent.com/wez/wezterm/master/termwiz/data/wezterm.terminfo \
  && tic -x -o ~/.terminfo $tempfile \
  && rm $tempfile

sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /home/linuxbrew/.linuxbrew/bin/wezterm 50
