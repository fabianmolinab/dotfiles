# dotfiles
My personal dotfiles Linux System | KDE Plasma | zsh

## ZSH Config

### Features
- Fast and flexible propt theme [PowerLevel10K](https://github.com/romkatv/powerlevel10k)
- Fastest zsh plugin manager on the market [zinit](https://github.com/zdharma-continuum/zinit)
- ls more customizable and multiple functions [eza](https://github.com/eza-community/eza)
- Nerd Font is recomended to install JetbrainsMono

### Installation guide

#### 1. Install zsh shell for linux distros
Install zsh with your package manager

##### Debian distros
```zsh
sudo apt install zsh
```
##### Fedora
```zsh
sudo dnf install zsh
```
##### Arch distros
```zsh
sudo pacman -S zsh
```
#### 2. Make your default shell
```bash
chsh -s $(which zsh)
```
Type `echo $SHELL` to verify the shell it should print `/usr/bin/zsh`

#### 3. Install dependencies zinit and eza
* To install zinit with the following command
```bash
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```
* Compile zinit
```bash
zinit self-update
```
* Clone this repository
```bash
cd ~
git clone https://github.com/fabianmolinab/dotfiles
```
* Delete automatically created `rm -rf ~/.zshrc`  and create the environment variable of this from this repository with the following command: 

```bash
ln -s ~/dotfiles/.zshrc ~/*
ln -s ~/dotfiles/.p10k.zsh ~/*
exec zsh
```
* And install [eza](https://github.com/eza-community/eza) for the linux distros

#### Create the file for zsh to save the history

```bash
touch ~/.zsh_history
chmod 600 ~/.zsh_history
```
This command will create the file to save the history and also the permissions

 *Enjoy your new zsh prompt*
