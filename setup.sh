#!/bin/bash
#########################
#This scripts creates symlinks from the home directory to any desired dotfiles in ~/Development/dotfiles
########################

#Variables

dir=~/Development/dotfiles
old_dir=~/Development/dotfiles_old
files="vimrc vim"		#list of files and folders to symlink in HOME

########

#create dotfiles_old in HOME
echo -n "Creating $old_dir for backup of any existing dotfiles in ~ ..."
mkdir -p $old_dir
echo "Done"

#change the dotfiles directory
echo -n "Changing to the $dir directory..."
cd $old_dir
echo "Done"

#move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/Development/dotfiles directory specified in $files
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $old_dir"
	mv ~/.$file old_dir
	echo "Creating symlink to $file in home directory"
	ln -s $dir/$file ~/.$file
done

