#
# jastronaut's .zshrc
#

bindkey -e
# zstyle :compinstall filename '/home/$USER/.zshrc'

autoload -Uz compinit
compinit

# Set up the prompt
autoload -Uz promptinit
autoload -U colors && colors
promptinit
PROMPT='%F{red}%~%f
» '
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

export PATH=/Users/jastronaut/Library/Python/3.8/lib/python/site-packages:$PATH


# aliases
## general
alias la="ls -a"
alias svim="sudo -E vim"
alias grep='grep --color=always'
alias agq='ag -Q'
alias pretty='npx prettier --write'

alias amen='brew update'
alias pip='pip3'

alias igt='git'
alias ':q'='bye'


## macos
alias preview='open -a Preview'


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

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"

export PATH="/Users/jastronaut/bin:$PATH"

source ~/.config/dotfiles/.zshrc_work
source ~/.config/dotfiles/.zshrc_safe
