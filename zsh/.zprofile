prev_dir=`pwd`
if command -v git &> /dev/null; then
    if [[ -d "$HOME/dotfiles" ]]; then
        # Update the repo
        cd "$HOME/dotfiles"
        git pull >/dev/null & # I don't care if I get new config immediately
    else
        # Clone the repo
        cd "$HOME"
        git clone "https://github.com/ndelta0/dotfiles.git"
        cd dotfiles
        # Set the remote push url to use ssh (keep pull to https to not prompt for key password)
        git remote set-url --push origin ssh://git@github.com/ndelta0/dotfiles.git >/dev/null &
    fi
fi
cd "$prev_dir"
