#!/bin/bash
#########################
#This scripts creates symlinks from the home directory to any desired dotfiles present in the current folder 
########################

#Variables

dir=`pwd`
old_dir=$dir/dotfiles_old
files="vimrc vim tmux.conf"		#list of files and folders to symlink in HOME

########

#create backup directory
echo -n "Creating $old_dir for backup of any existing dotfiles in ~ ..."
mkdir -p $old_dir
echo "Done"

#change the dotfiles directory
#echo -n "Changing to the $dir directory..."
#cd $old_dir
#echo "Done"

#move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the current folder 
for file in $files; do
	echo "Moving $file from ~ to $old_dir"
	mv -v ~/.$file $old_dir/$file
	echo "Creating symlink to $file in home directory"
	ln -s $dir/$file ~/.$file
done

