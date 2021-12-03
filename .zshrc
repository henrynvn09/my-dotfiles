# add empty line when start
echo

export __NV_PRIME_RENDER_OFFLOAD=1
export __GLX_VENDOR_LIBRARY_NAME="nvidia"
export __VK_LAYER_NV_optimus="NVIDIA_only"

#fix loi completion duplicate when tab -> locale-gen
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# add /home/ying/.local/bin to path
export PATH="$HOME/.local/bin:$PATH"

export I3_SCRIPTS="$HOME/.config/i3/scripts"

# basic configs {{{1
# Path to your oh-my-zsh installation.
export ZSH="/home/ying/.config/oh-my-zsh"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.config/zsh-custom

# Speeds up load time
DISABLE_UPDATE_PROMPT=true

# Uncomment the following line to disable bi-weekly auto-update checks.
 DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# ls_colors {{{2 
command -v vivid  > /dev/null && export LS_COLORS="$(vivid generate $ZSH_CUSTOM/molokai.yml)"
#}}}


# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="pi-mod"
ZSH_THEME_RANDOM_CANDIDATES=(
  "robbyrussell"
  "muse"
  "pi-mod"
  "tjkirch"
  "garyblessington"
)
# 1}}}

## Plugin settings {{{1

# completion
fpath=($HOME/.config/zsh-custom/completions $fpath)

# Add wisely, as too many plugins slow down shell startup.
plugins=(
	command-not-found
	copydir
	sprunge
	vi-mode
	history-substring-search
	fzf
    jump
	sudo
	z				# most recent history directories
	dircycle			# jump back dir and forward dir

	# install from github
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-completions
	zsh-autopair
	# my
	misc-user-plugins
	community
    ying-notes
)

# Always keep here
source $ZSH/oh-my-zsh.sh

# require by auto completion
#autoload -U compinit && compinit
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# Don't resolve symbolic links in z
_Z_NO_RESOLVE_SYMLINKS="true"

# dircycle
bindkey '^[[1;5D' insert-cycledleft # left 1 folder
bindkey '^[[1;5C' insert-cycledright # right 1 folder

# jump
alias j=jump
alias m=mark
alias ms=marks

#1}}}

## Extra settings {{{1

# Do not override files using `>`, but it's still possible using `>!`
set -o noclobber

# remove underline in PATH suggestion
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Vi-mode prompt
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-N-}/(main|viins)/-I-}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

#1}}}


# Aliases {{{1
# For a full list of active aliases, run `alias`.

#TERM="urxvt"
alias vi=nvim

export VISUAL=nvim
export EDITOR=nvim

export FZF_DEFAULT_COMMAND='rg --files --hidden --encoding "UTF-8"'

command -v bat  > /dev/null && export FZF_CTRL_T_OPTS="--height 100% --preview 'bat -p  --color=always {}'"
command -v blsd > /dev/null && export FZF_ALT_C_COMMAND='blsd'
command -v tree > /dev/null && export FZF_ALT_C_OPTS="--height 100% --preview 'tree -C {} | head -200'"

alias remind="task add pro:REMIND"

#setting for taking Textbook
export CURRENT_COURSE=$HOME/Documents/notes/current_course

#
export YEAR=1 #Current year at university
export MODULE=1 #Current module at year
export NOTES_DIR=$HOME/Documents/notes
export TEXTBOOKS_DIR=$NOTES_DIR/textbooks #textbooks directory

export DROPBOX_DIR=$HOME/Dropbox/notes
export PDFNOTES_DIR=$DROPBOX_DIR/textbooks #dropbox directory for notes pdf

export VIMCONFIGS=~/.config/rofi

export FONT=$HOME/.fonts
export CONFIG=$HOME/.config
export WALLPAPERS=$HOME/Pictures/Wallpapers
export DOWNLOADS=$HOME/Downloads

alias t=todo.sh
eval $(thefuck --alias)
# 1}}}

# Key bindings {{{1

bindkey '^F' autosuggest-accept
# CTRL + U more accessible Undo
bindkey '^U' undo
# CTRL + Y redo
bindkey '^Y' redo
# CTRL + K deletes whole line
bindkey '^K' kill-buffer
# ALT + DEL deletes whole forward-word
bindkey '^W' kill-word
# CTRL + BACKSPACE deletes whole backward-word
bindkey '^B' vi-backward-kill-word
# ALT + L lowercases word
bindkey '^[l' down-case-word
# Move cursor forward a word
bindkey '^L' forward-word
# Move cursor backward a word
bindkey '^H' backward-word

bindkey " " magic-space

# 1}}}

