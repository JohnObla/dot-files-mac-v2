# set default editor to neovim 
set -gx EDITOR nvim

# set long path for prompt
set -g theme_short_path no

# add homebrew to path based on architecture
if test (uname -m) = "arm64"
    fish_add_path /opt/homebrew/bin
    set -gx SHELL /opt/homebrew/bin/fish
else
    fish_add_path /usr/local/bin
    set -gx SHELL /usr/local/bin/fish
end

# create n location and add to path
set -gx N_PREFIX $HOME/n
fish_add_path $N_PREFIX/bin

# set config home
set -gx XDG_CONFIG_HOME $HOME/.config
