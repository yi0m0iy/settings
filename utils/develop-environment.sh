#!/bin/bash

# SymbolicLink
ln -sf $HOME/settings/scripts/arch-news.py $HOME/.local/bin/arch-news
ln -sf $HOME/settings/fish/config.fish $HOME/.config/fish/config.fish
ln -sf $HOME/settings/w3m/* $HOME/.w3m

# Executable
cd $HOME/settings/scripts
chmod 755 arch-news.py
cd ../w3m/cgi-bin
chmod 755 ./*
