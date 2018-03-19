# move all dot files to home directory
mv .* ~

# install vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install plugins in vim with vundle
vim -c "execute 'PluginInstall'"

