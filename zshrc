# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

stty -ixon

alias vi='mvim -v'
# alias vim='mvim -v'
alias e='mvim -v'

alias todo='vim ~/Documents/todo.md + -c "set norelativenumber invwrap wrap linebreak laststatus=0"'
alias espresso='open -a Espresso'
alias firefox='open -a firefox'
alias preview='open -a Preview'
alias chrome='open -a Google\ Chrome'
alias safari='open -a Safari'
alias mail='mutt -f ~/Mail/Swarm/INBOX'
alias finder='open -a Finder'
alias tmsize='tmux detach -a'
alias swarmint='ssh swarmint'
alias swarm1='ssh swarm1'
alias swarm2='ssh swarm2'
alias swarm3='ssh swarm3'
alias staging='ssh staging@swarm.swarm1.com'
alias redesign='ssh redesign@swarm.swarm1.com'
alias chat='mcabber'
alias gmail='mutt -f ~/Mail/Gmail/INBOX'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pure"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git subl tmux osx rand-quote web-search)

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Users/Seth/Dropbox/Swarm/Web/Script:/Users/Seth/SSH:$PATH
export PROMPT_COMMAND='echo -ne "\033]0;Terminal\007"'
export TERM=xterm-256color

source $ZSH/oh-my-zsh.sh

alias news='newsbeuter'
