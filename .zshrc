#
# jastronaut's .zshrc
# HISTFILE=~/.config/zsh/.histfile
#HISTSIZE=1000
#SAVEHIST=1000
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

function dlmusic()
{
	youtube-dl --extract-audio --audio-format mp3 "$1"
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
alias la="ls -a"
alias svim="sudo -E vim"
alias ':q'='bye'
alias grep='grep --color=always'

alias amen='brew update'

alias mongod='mongod --dbpath ~/www/mongo'

alias showhidden='defaults write com.apple.finder AppleShowAllFiles YES'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles NO'
alias pip='pip3'
alias dls="cd '~/Library/Mobile Documents/com~apple~CloudDocs/Downloads'"
alias icscon="ssh jasmincd@openlab.ics.uci.edu"
alias appjascon="ssh appjas@apps.jasdelgado.com"
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"
alias httpdre="sudo /usr/sbin/apachectl restart"

# get the keys working correctly
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word

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


# make zsh colorize ls output
export CLICOLOR=1

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
