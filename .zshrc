# Lines configured by zsh-newuser-install
HISTFILE=~/.config/.histfile
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
RPROMPT='%T %W'

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
alias python=python3
alias subl=subl3
alias emote="./bin/emote"
alias forts="fortune -s"

# path stuff
export PATH=/home/naut/bin:$PATH
