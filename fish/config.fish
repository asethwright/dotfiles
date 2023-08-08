alias l="ls -lah"
alias puf='vendor/bin/phpunit --filter '
alias pu='vendor/bin/phpunit test'

alias firefox='open -a firefox'
alias preview='open -a Preview'
alias chrome='open -a Google\ Chrome'
alias safari='open -a Safari'
alias finder='open -a Finder'
alias tmsize='tmux detach -a'
alias c="code ."
alias v="nvim"
alias e="nvim"
alias vim="nvim"
alias m="nvim"
alias s="subl ."
alias cleanup_branches="git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | grep -v '\*' | xargs -r git branch -D"

bind -s -k nul ~/dotfiles/scripts/tmux-sessionizer
alias tms="~/dotfiles/scripts/tmux-sessionizer"

# quick theme switching
alias darker='ln -sf ~/dotfiles/materitermdarkmode.sh ~/.base16_theme  && eval sh '"'(realpath ~/.base16_theme)'"''
alias material='ln -sf ~/dotfiles/materitermdark.sh ~/.base16_theme && eval sh '"'(realpath ~/.base16_theme)'"''
alias pale='ln -sf ~/dotfiles/materitermpale.sh ~/.base16_theme  && eval sh '"'(realpath ~/.base16_theme)'"''
alias ocean='ln -sf ~/dotfiles/materitermocean.sh ~/.base16_theme  && eval sh '"'(realpath ~/.base16_theme)'"''
alias lighter='ln -sf ~/dotfiles/materitermlighter.sh ~/.base16_theme  && eval sh '"'(realpath ~/.base16_theme)'"''
alias light='ln -sf ~/dotfiles/materitermlight.sh ~/.base16_theme  && eval sh '"'(realpath ~/.base16_theme)'"''
alias minlight='ln -sf ~/dotfiles/minlight.sh ~/.base16_theme  && eval sh '"'(realpath ~/.base16_theme)'"''
alias mindark='ln -sf ~/dotfiles/mindark.sh ~/.base16_theme  && eval sh '"'(realpath ~/.base16_theme)'"''
alias nord='ln -sf ~/dotfiles/nord.sh ~/.base16_theme  && eval sh '"'(realpath ~/.base16_theme)'"''
alias monokaipro='ln -sf ~/dotfiles/monokaipro.sh ~/.base16_theme  && eval sh '"'(realpath ~/.base16_theme)'"''
alias monokaioctagon='ln -sf ~/dotfiles/monokaioctagon.sh ~/.base16_theme  && eval sh '"'(realpath ~/.base16_theme)'"''
alias monokaimachine='ln -sf ~/dotfiles/monokaimachine.sh ~/.base16_theme  && eval sh '"'(realpath ~/.base16_theme)'"''
alias monokairistretto='ln -sf ~/dotfiles/monokairistretto.sh ~/.base16_theme  && eval sh '"'(realpath ~/.base16_theme)'"''
alias monokaispectrum='ln -sf ~/dotfiles/monokaispectrum.sh ~/.base16_theme  && eval sh '"'(realpath ~/.base16_theme)'"''
alias dracula='ln -sf ~/dotfiles/dracula.sh ~/.base16_theme && eval sh '"'(realpath ~/.base16_theme)'"''
alias gruvbox='ln -sf ~/dotfiles/gruvbox.sh ~/.base16_theme && eval sh '"'(realpath ~/.base16_theme)'"''
alias gruvbox-light='ln -sf ~/dotfiles/gruvbox-light.sh ~/.base16_theme && eval sh '"'(realpath ~/.base16_theme)'"''
alias github='ln -sf ~/dotfiles/github.sh ~/.base16_theme && eval sh '"'(realpath ~/.base16_theme)'"''
alias githubdark='ln -sf ~/dotfiles/githubdark.sh ~/.base16_theme && eval sh '"'(realpath ~/.base16_theme)'"''

# tmux
alias td="tmux detach"

# git stuff
alias ga="gg a"
alias gac="gg c"
alias gc="gg cn"
alias gco="git checkout"
alias gd="git difftool"
alias gs="git status"
alias gl="gg l"
alias gp="gg p"
alias gpl="gg pl"
alias gph="git push -u origin HEAD"
alias gcl="gh browse -n -c | sed 's/https:\/\/github\.com\///' | sed 's/\/tree\//@/' | sed 's/.\$//' | pbcopy"

alias work="tmux new-session -A -s work"
alias endwork="tmux kill-session -t work"

set -gx EDITOR nvim
set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!{node_modules/*,vendor/*,.git/*}"'

set VAGRANT_DEFAULT_PROVIDER parallels
set ANDROID_HOME ~/Library/Android/sdk

# set path
set PATH /usr/local/bin /opt/homebrew/bin /usr/local/sbin /usr/local/opt/ruby/bin /usr/bin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin $PATH
set PATH $PATH:/Users/sethwright/.cargo/bin
set PATH $PATH:$(brew --prefix python)/libexec/bin
set PATH $PATH vendor/bin
set PATH $PATH node_modules/.bin
set PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

status --is-interactive; and rbenv init - fish | source

set -gx PNPM_HOME /Users/sethwright/Library/pnpm
set -gx PATH "$PNPM_HOME" $PATH

if status is-interactive
    and not set -q TMUX
    if tmux has-session -t home
        exec tmux attach-session -t home
    else
        tmux new-session -s home
    end
end
