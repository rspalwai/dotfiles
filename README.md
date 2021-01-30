# dotfiles
my dotfiles

# neovim
install neovim nightly as well as language servers of your choice
```
brew install neovim --HEAD
brew install ccls
```
open neovim and run the command after config file has been put in proper directory
```
:PlugInstall
```
# fish shell
install fish shell and omf
```
brew install fish
curl -L https://get.oh-my.fish | fish
```
change default shell to fish shell
```
chsh -s /usr/bin/fish
```
# alacritty
install alacritty
```
brew install alacritty
```

# finishing touches
import all config files
restart terminal and enjoy
