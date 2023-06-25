#!/bin/sh

cd || exit
curl -o .git-completion.sh \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o .git-prompt.sh \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

echo ""
echo "Insert these scripts to the bottom of your .bashrc."
echo "--------------------------------------------------"

cat << 'EOS'
if [ -f ~/.git-completion.sh ]; then
    source ~/.git-completion.sh
fi
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=
GIT_PS1_SHOWUPSTREAM=

#PS1='[\[\033[32m\]\u@\h\[\033[00m\] \[\033[33m\]\w\[\033[1;36m\]$(__git_ps1 " (%s)")\[\033[00m\]]\n\$ '
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[1;36m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '
EOS
echo "--------------------------------------------------"
