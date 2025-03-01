# Allow brew commands to be executed based on architecture
if [[ "$(uname -m)" == "arm64" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"  # Apple Silicon (M1/M2)
else
  eval "$(/usr/local/bin/brew shellenv)"  # Intel Macs
fi
