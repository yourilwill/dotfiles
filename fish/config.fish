set PATH /usr/local/bin /usr/sbin $PATH

set -U FZF_LEGACY_KEYBINDINGS 0

set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache

set --export http_proxy http://172.26.0.100:3128/
set --export https_proxy http://172.26.0.100:3128/

alias g='git'
alias xkey='sudo -E xkeysnail config.py'
set -g TERM xterm-256color

set -U fish_user_paths ~/.asdf/installs/python/3.8.6/bin/ $fish_user_paths
source ~/.asdf/asdf.fish
