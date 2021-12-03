#{{{1 Script to toggle laptops touchpad and keyboard
touchpad-toggle() {
	id="$(xinput list | grep -Eo 'Touchpad.*id=[0-9]*' | grep -Eo '[0-9]*')"
	mode="$(echo "$id" | xargs -I % xinput --list-props % | grep 'Device Enabled' | grep -Eo ':.*[0|1]' | grep -Eo '[0|1]')"
	
	if [ "$mode" -eq "1" ]; then
	  xinput set-prop "$id" "Device Enabled" 0 && notify-send "Touchpad" "Touchpad has been disabled"
	else
	  xinput set-prop "$id" "Device Enabled" 1 && notify-send "Touchpad" "Touchpad has been enabled"
	fi
}

keyboard-toggle() {
	id1="$(xinput list | grep -Eo 'HHKB-Hybrid_[0-9] Keyboard.*id=[0-9]*' | grep -Eo '[0-9]*')"
	id="$(xinput list | grep -Eo 'AT Translated Set [0-9] keyboard.*id=[0-9]+' | grep -Eo 'id=[0-9]+' | grep -Eo '[0-9]+')"
	mode="$(echo "$id" | xargs -I % xinput --list-props % | grep 'Device Enabled' | grep -Eo ':.*[0|1]' | grep -Eo '[0|1]')"
	
	if ! [ -z "$id1" ]; then
	        ##disable internal keyboard
	        if [ "$mode" -eq "1" ]; then
	          xinput set-prop "$id" "Device Enabled" 0 && notify-send "Internal keyboard" "Internal keyboard has been disabled"
		else
  		  xinput set-prop "$id" "Device Enabled" 1 && notify-send "Internal keyboard" "Internal keyboard has been enabled"
		fi
	else
	        ##enable internal keyboard
	        if [ "$mode" -eq "1" ]; then
	          xinput set-prop "$id" "Device Enabled" 1 && notify-send "Internal keyboard" "Internal keyboard has been enabled"
	        fi
	fi

}
#}}}1

#{{{1 git command
# No arguments: `git status`
# With arguments: acts like `git`
g() {
    if [[ $# -gt 0 ]]; then
      git "$@"
    else
      git status
    fi
}

gf() {
    is_in_git_repo || return
    git -c color.status=always status --short |
    fzf-down -m --ansi --nth 2..,.. \
      --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
    cut -c4- | sed 's/.* -> //'
}

gb() {
    is_in_git_repo || return
    git branch -a --color=always | grep -v '/HEAD\s' | sort |
    fzf-down --ansi --multi --tac --preview-window right:70% \
      --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -200' |
    sed 's/^..//' | cut -d' ' -f1 |
    sed 's#^remotes/##'
}

gt() {
    is_in_git_repo || return
    git tag --sort -version:refname |
    fzf-down --multi --preview-window right:70% \
      --preview 'git show --color=always {} | head -200'
}

gh() {
    is_in_git_repo || return
    git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
    fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
      --header 'Press CTRL-S to toggle sort' \
      --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -200' |
    grep -o "[a-f0-9]\{7,\}"
}

gr() {
    is_in_git_repo || return
    git remote -v | awk '{print $1 "\t" $2}' | uniq |
    fzf-down --tac \
      --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
    cut -d$'\t' -f1
}

gs() {
    is_in_git_repo || return
    git stash list | fzf-down --reverse -d: --preview 'git show --color=always {1}' |
    cut -d: -f1
}
#}}}1

#{{{1 yadm -> y
# No arguments: `yadm status`
# With arguments: acts like `yadm`
y() {
  if [[ $# -gt 0 ]]; then
    yadm "$@"
  else
    yadm status -unormal
  fi
}
#}}}1

#{{{1 Add font
addFont() {
  if [[ $# -gt 0 ]]; then
    mv "$@" ~/.fonts/
  fi
}


# fzf commands {{{1

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% "$@" --border
}

#}}}1

#{{{ fzf running process
fp() {
    ps -ef | fzf-down --header-lines 1 --info inline --layout reverse --multi |
      awk '{print $2}'
}
#}}} recent folder
#{{{ fzf recent folder
ff() {
    _z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info --tac | sed 's/^[0-9,.]* *//'
}
#}}}


#{{{1 poromodo timer
epomorodo() {
  ~/.config/polybar/scripts/pomodoro_timer.py end
}

tpomodoro() {
  ~/.config/polybar/scripts/pomodoro_timer.py toggle
}

#{{{ nvim file with fzf in .config
fcf() {
    cd ~/.config/
    FI=$(fzf --preview 'bat {} || tree -C {}')
    if [ -n "$FI" ]; then
        nvim $FI
    fi
    cd -
}

#{{{ nvim folder with fzf in .config
fcd() {
    cd ~/.config/
    FI=$(fzf --preview 'bat {} || tree -C {}')
    if [ -n "$FI" ]; then
        nvim $FI
    fi
    cd -
}

update-mirrors-ying() {
    sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu
}

addFirewallRule(){
    if [[ $# -gt 0 ]]; then
       sudo iptables -I INPUT -p udp --dport "$1" -m state --state NEW,ESTABLISHED -j ACCEPT
       sudo iptables -A OUTPUT -p udp --sport "$1" -m state --state NEW,ESTABLISHED -j ACCEPT
       sudo iptables -I INPUT -p tcp --dport "$1" -m state --state NEW,ESTABLISHED -j ACCEPT
       sudo iptables -A OUTPUT -p tcp --sport "$1" -m state --state NEW,ESTABLISHED -j ACCEPT
       echo "done $1"
    else
      echo "1 rule"
    fi
}

clear-cache(){
    yay -Sc --aur
}
