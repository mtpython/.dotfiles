# adb
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# bun completions
# [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"

# fnm
export PATH="$HOME/Library/Application Support/fnm:$PATH"
eval "$(fnm env)"

  # Download Znap, if it's not there yet.
  [[ -r ~/Repos/znap/znap.zsh ]] ||
      git clone --depth 1 -- \
      https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
        source ~/Repos/znap/znap.zsh # Start Znap

  # starship
  eval "$(starship init zsh)"

  # zsh-autocomplete
  znap source marlonrichert/zsh-autocomplete

  # fast-syntax-highlighting
  znap source zdharma-continuum/fast-syntax-highlighting

  # zsh-autosuggestions
  znap source zsh-users/zsh-autosuggestions
