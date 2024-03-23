# set default editor to neovim 
set -gx EDITOR nvim

# set long path for prompt
set -g theme_short_path no

# add homebrew to path
fish_add_path /opt/homebrew/bin

# create n location and add to path
set -gx N_PREFIX $HOME/n
fish_add_path $N_PREFIX/bin