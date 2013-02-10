ll
ls -al
rm -rf *
ls -al
rm -rf .*
ls -al
ls -al
git init
ll
ll
mkdir bin logs etc tmp src archives .homedir .emacs.d projects secure
ll
for dir in $(ls); do touch $dir/.gitkeep; done
git add .
git commit
git config --global user.email "james@zero-internet.org.uk"
git config --global user.name "jspc"
git commit
cat > .gitignore
emacs .gitignore 
git add .gitignore
git commit -m "Git ignore"
ll
mkdir bashables
mv bashables/
mv bashables/ .bashables/
cd .bash
cd .bashables/
wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
ll
cd ..
emacs bin/hostnames_from_ssh
emacs bin/hostnames_from_ssh
chmod +x bin/hostnames_from_ssh 
git status
cat .gitconfig 
git add .bashables/
git commit -m "Bash completion scripts and addons"
git add .gitconfig 
git commit -m "Simple config"
ll
git status
emacs .bashables/ssh-completion.bash
emacs .bashables/git-completion.bash 
ping 8.8.8.8
ifconfig 
ping 10.0.2.27
mtr 10.0.2.27
ll bin/
ll
cd .bash
cd .bashables/
ll
man complete
complete -h
complete -C "$HOME/bin/hostnames_from_ssh" -A hostname ssh
ll .ssh
ssh git@github.com
ssh jcondrongithub.com 
ll
ll
ll
mv hostnames_from_ssh ssh-completion.sh
ll
mv git-completion.bash git-completion
mv ssh-completion.sh ssh-completion
l;
ll
chmod 600 *
ll
cd ..
ll
emacs .bash_profile
host 10.10.0.159
ping 10.10.0.159
