# Path to your oh-my-zsh installation.
export ZSH="/home/arnstein/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias x='exit'
alias ..='cd ..'
alias a='alsamixer'

gac() {
google-chrome-stable
exit
}

# Switch caps and escape
/usr/bin/setxkbmap -option "caps:swapescape"

# Toggle between Norwegian and US layout with alt+shit
/usr/bin/setxkbmap -layout us,no
/usr/bin/setxkbmap -option "grp:alt_shift_toggle"

source .fehbg

evan `dircolors /home/arnstein/.dir_colors/dircolors`
