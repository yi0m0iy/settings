#!/bin/bash

# SymbolicLink
ln -sf $HOME/settings/scripts/arch-news.py $HOME/.local/bin/arch-news
ln -sf $HOME/settings/fish/config.fish $HOME/.config/fish/config.fish
ln -sf $HOME/settings/_w3m/* $HOME/.w3m
ln -sf $HOME/setttings/HOME/_vimrc $HOME/_vimrc

# Executable
cd $HOME/settings/scripts
chmod 755 arch-news.py
cd ../_w3m/cgi-bin
chmod 755 ./*