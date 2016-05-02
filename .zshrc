#
# jastronaut's .zshrc

HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename '/home/$USER/.zshrc'

autoload -Uz compinit
compinit

# Set up the prompt
autoload -Uz promptinit
autoload -U colors && colors
promptinit
PROMPT='%F{red}%~%f
» '

# compile .tex, .bib, then .tex again
function texx()
{
	pdflatex $1.tex && bibtex $1.aux && pdflatex $1.tex
}

function sym()
{
	ln -s "$1" "$(pwd)"
}

# tab stuff
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

if [[ -x "`whence -p dircolors`" ]]; then
	eval `dircolors`
	alias ls='ls -F --color=auto'
else
	alias ls='ls -F'
fi

setopt auto_cd

# aliases
alias forts="fortune -s"
alias la="ls -a"
alias batt="acpi -b"
alias svim="sudo -E vim"
alias fungeon='cd /run/media/$USER/SHITDUNGEON'
alias ':q'='bye'
alias err='cat .xsession-errors'
alias grep='grep --color=always'
alias 'g++'='g++ -std=c++11'
## pacman aliases
alias amen='pacaur -Syu'
alias pacinfo='pacaur -Qi'
alias pacsearchall='pacaur -Ss'
alias pacsearchloc='pacaur -Qs'
alias pacorphans='pacaur -Qtdq'

# path stuff - i have no idea what is going on
export PATH=~/bin:~/bin/colorscripts:~/bin/other:~/.config/bspwm:$PATH
export PATH=~/.gem/ruby/2.3.0/bin:$PATH

# get the keys working correctly
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}

[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"   forward-char

function zle-line-init()
{
	echoti smkx

}
function zle-line-finish()
{
	echoti rmkx

}
zle -N zle-line-init
zle -N zle-line-finish
