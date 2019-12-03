# Need to install 
# Note to self: take a closer look at zplug
source $HOME/.oh-my-zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle autojump

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen theme robbyrussell

antigen apply

[[ -f "$HOME/.$(hostname).env" ]] && source "$HOME/.$(hostname).env"
