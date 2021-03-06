# Installation

Note: I don't recommend cloning and using my entire dotfiles. Instead, it is best to use pieces for your own configuration that makes sense to your own workflow. The steps listed below are to help me quickly get a new machine running when necessary.

## Step 1 - Install Homebrew

**Copy & paste the following** into the terminal window and **hit `Return`**.

```javascript
var myVar = 'test';
```

```shell
ruby -e "$(curl -fsSL https://raw.zshhubusercontent.com/Homebrew/install/master/install)"
brew doctor
```

You will be requested to install the *Command Line Developer Tools* from *Apple*. **Confirm by clicking *Install**. After the installation finished, continue installing *Homebrew* by **hitting `Return`** again.

## Step 2 – Install *zsh*

**Enter the following** into the terminal window and **hit `Return`**.

```shell
brew install zsh
```
**You can use *zsh* now.**

## Step 3 – default shell

To set *zsh* as your default shell, execute the following.

```shell
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh
```

## Step 4 - clone dotfiles repository

```shell
git clone --recursive https://github.com/asethwright/dotfiles.git
```

## Step 5 - install antigen

```shell
mkdir -p ~/.config/antigen/
curl https://cdn.rawgit.com/zsh-users/antigen/v1.3.4/bin/antigen.zsh > ~/.config/antigen/antigen.zsh
```

## Step 6 - **optional** install applications

```shell
brew install caskroom/cask/brew-cask 2> /dev/null
brew cask install hammerspoon
brew install zsh
brew install mutt
brew install vim
brew install tmux
```

## Step 7 - install dotfiles

```shell
cd dotfiles
./makesymlinks.sh
```

## Step 8 - restart terminal

Antigen should install oh-my-zsh and any plugins

## Step 9 -  **optional** setup vim

```shell
vim
```

Then type :PluginInstall<return>

Now you should be all set!
