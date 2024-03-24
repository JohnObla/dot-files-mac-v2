# Dot Files
## Install on Mac
### Clone Repo
`git clone git@github.com:JohnObla/dot-files-mac-v2.git ~/.dotfiles`

### Install `.dotfiles`
```
cd ~/.dotfiles \
&& ~/.dotfiles/install --except shell \
&& source ~/.zshrc && echo "Sourcing ~/.zshrc" \
&& ~/.dotfiles/install --only shell
```
