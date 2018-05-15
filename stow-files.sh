#!/bin/bash
#
STOW_FILES="vim tmux"
DOTFILES_FOLDER=/home/$USER/.dotfiles

stow -d $DOTFILES_FOLDER -R $STOW_FILES
