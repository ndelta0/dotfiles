[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -s "$HOME/.wasmedge/env" ] && . "$HOME/.wasmedge/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # Load nvm

export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac
