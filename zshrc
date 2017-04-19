stty -ixon

KEYTIMEOUT=1
source ~/.config/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle sublime
antigen bundle colorize
# antigen bundle tmux
# antigen bundle vi-mode

antigen apply

alias todo='vim -c "set norelativenumber nonumber laststatus=0" -c "VimwikiIndex"'
alias org='vim -c "set norelativenumber nonumber laststatus=0" -c "VimwikiIndex"'
alias espresso='open -a Espresso'
alias firefox='open -a firefox'
alias preview='open -a Preview'
alias chrome='open -a Google\ Chrome'
alias safari='open -a Safari'
alias mail='mutt -f ~/Mail/Swarm/INBOX'
alias service='mutt -f ~/Mail/Service/INBOX'
alias gmail='mutt -f ~/Mail/Gmail/INBOX'
alias unc='mutt -f ~/Mail/UNC/INBOX'
alias finder='open -a Finder'
alias tmsize='tmux detach -a'
alias swarmint='ssh swarmint@swarm.swarm1.com'
alias swarm1='ssh swarm1'
alias swarm2='ssh swarm2'
alias swarm3='ssh seth@swarm.swarm1.com'
alias gridserver='ssh seth'
alias staging='ssh staging@swarm.swarm1.com'
alias redesign='ssh redesign@swarm.swarm1.com'
alias chat='mcabber'
alias dan='ssh danielniblock@192.168.1.13'
alias christine='ssh cmh@192.168.1.14'
alias scott='ssh Scott@192.168.1.17'
alias randall='ssh relmo@192.168.1.15'
alias intern='ssh render@192.168.1.19'
alias render='ssh render@192.168.1.20'
alias linux='ssh linux'
alias timestamp='date +"%Y-%m-%d %H:%M:%S"'
alias v="vim"
alias e="vim"
alias m="mvim"
alias s="subl ."
alias adbpic='adb shell screencap -p | perl -pe "s/\x0D\x0A/\x0A/g" > "/Users/seth/Downloads/firetvscreenshot_$(date +%Y%m%d-%H%M%S).png"'
alias firetv='adb kill-server && adb start-server && adb connect 192.168.1.98'
alias news="newsbeuter"
alias work="mux start work"
alias endwork="mux stop work"

# quick theme switching
alias dark='ln -sf ~/dotfiles/base16-materialdark.sh ~/.zsh_theme  && . ~/.zsh_theme'
alias light='ln -sf ~/dotfiles/base16-materiallight.sh ~/.zsh_theme  && . ~/.zsh_theme'

# git stuff
alias ga="gg a"
alias gac="gg c"
alias gc="gg cn"
alias gco="git checkout"
alias gd="git difftool"
alias gs="gg s"
alias gl="gg l"
alias gp="gg p"
alias gpl="gg pl"

# set path
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$PATH
export PATH=$PATH:/users/seth/dropbox/swarm/web/script
export PATH=$PATH:/Users/seth/Scripts
export PATH=$PATH:/Users/seth/Library/Android/sdk/platform-tools
export PATH=$PATH:/Users/seth/Library/Android/sdk/tools
export PATH=$PATH:$HOME/.yarn/bin
export PATH=$PATH:$HOME/.composer/vendor/bin

export EDITOR='vim'

source ~/.config/tmuxinator.zsh

if [[ -f ~/.zsh_theme ]]; then
  . ~/.zsh_theme
else
  dark
fi
