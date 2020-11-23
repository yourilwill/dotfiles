set PATH /usr/local/bin /usr/sbin $PATH
# set -x RBENV_ROOT "$HOME/.rbenv"
# status --is-interactive; and source (anyenv init -|psub)
# set PATH $RBENV_ROOT $PATH
# status --is-interactive; and source (rbenv init -|psub)

# set PATH $HOME/.pyenv/shims $PATH
# eval (pyenv init - | source)

source ~/.asdf/asdf.fish

set -U FZF_LEGACY_KEYBINDINGS 0

# c-gでリポジトリに移動
function ghq_fzf_repo -d 'Repository search'
  ghq list --full-path | fzf --reverse --height=100% | read select
  [ -n "$select" ]; and cd "$select"
  echo " $select "
  commandline -f repaint
end

# fzf関連の設定

function fish_user_key_bindings
  bind \cg ghq_fzf_repo
end

# 一覧の上を最新として、境目をボーダーに
set -x FZF_DEFAULT_OPTS "--height 10% --reverse --border"

# test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

alias g='git'
