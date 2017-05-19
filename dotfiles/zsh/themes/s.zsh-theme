ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"

function get_pwd() {
  path="${PWD/$HOME/~}"
  path=(${(s:/:)path})
  echo "\n $path[${#path}] "
}

function git_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " $(parse_git_dirty)$(current_branch) "
}

PROMPT=' %{$fg[magenta]%}$(get_pwd)$(git_branch)%{$reset_color%}'
