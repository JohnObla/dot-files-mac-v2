# Dot Files
## Install on Mac
### Clone Repo
```bash
git clone https://github.com/JohnObla/dot-files-mac-v2.git ~/.dotfiles
```

### Install Dotfiles
⚠️ Only run code below on `bash` compatible shell (e.g. `bash` or `zsh`)
```bash
cd ~/.dotfiles \
&& ~/.dotfiles/install --except shell \
&& source ~/.zshrc && echo "Sourcing ~/.zshrc" \
&& ~/.dotfiles/install --only shell
```
