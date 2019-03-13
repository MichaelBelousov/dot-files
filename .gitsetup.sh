
# TODO: add conditional for cygwin windows vs real linux
git config --global core.autocrlf "input"
git config --global core.safecrlf "false"
git config --global user.name "Michael Belousov"
git config --global user.email "michael.belousov98@gmail.com"
git config --global core.editor "vim"

git config --global alias.lgb "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset%n' --abbrev-commit --date=relative --branches"
git config --global alias.stat "status"

# vim diffs
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d "difftool"
git config --global difftools.vimdiff.cmd 'vimdiff "$LOCAL" "$REMOTE"'
