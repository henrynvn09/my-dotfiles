#PROMPT=' ${return_status} %{$fg_bold[blue]%}$(get_pwd)%{$reset_color%} $(git_prompt_info)
PROMPT=' ${return_status} %B%F{blue}$(get_pwd)%f $(git_prompt_info)
${prompt_suffix}'

#local return_status=" %(?:%{$fg_bold[green]%}π:%{$fg_bold[red]%}π)"
local return_status=" %(?:%B%F{green}π%f%b:%F{red}π)%f%b"

#local prompt_suffix=" %{$fg[magenta]%}❯%{$reset_color%} "
local prompt_suffix=" %B%F{magenta}❯%f%b "

# by shashankmehta (https://github.com/shashankmehta)
function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

ZSH_THEME_GIT_PROMPT_PREFIX="%F{green}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f "
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{yellow}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
#ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
