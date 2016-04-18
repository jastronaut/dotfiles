#
# jastronaut's .zshrc

# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=100
SAVEHIST=100
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/naut/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

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
alias con='nmtui'
alias grep='grep --color=always'
## pacman aliases
alias amen='pacaur -Syu'
alias pacinfo='pacaur -Qi'
alias pacsearch='pacaur -Ss'
alias pacorphans='pacaur -Qtdq'

# path stuff
export PATH=~/bin:$PATH
export PATH=~/.gem/ruby/2.3.0/bin:$PATH

# get the keys working correctly
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
#key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
#key[PageUp]=${terminfo[kpp]}
#key[PageDown]=${terminfo[knp]}

[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"     end-of-line
#[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"   forward-char

function zle-line-init () {
    echoti smkx

}
function zle-line-finish () {
    echoti rmkx

}
zle -N zle-line-init
zle -N zle-line-finish
