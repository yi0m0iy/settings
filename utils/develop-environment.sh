#!/bin/bash

# SymbolicLink
ln -sf $HOME/settings/scripts/arch-news.py $HOME/.local/bin/arch-news
ln -sf $HOME/settings/fish/config.fish $HOME/.config/fish/config.fish

# Executable
cd $HOME/settings/utils
chmod 755 make-link.sh
cd $HOME/settings/scripts
chmod 755 arch-news.py
