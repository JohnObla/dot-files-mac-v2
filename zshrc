# Create n location and add to path
export N_PREFIX="$HOME/n"
path+=("$N_PREFIX/bin")

# Add Homebrew to path based on architecture
if [[ "$(uname -m)" == "arm64" ]]; then
  path+=("/opt/homebrew/bin")  # Apple Silicon (M1/M2)
else
  path+=("/usr/local/bin")  # Intel Macs
fi

# --- Gas Town Integration (managed by gt) ---
[[ -f "/Users/johnobla/.config/gastown/shell-hook.sh" ]] && source "/Users/johnobla/.config/gastown/shell-hook.sh"
# --- End Gas Town ---
