#!/bin/zsh

# Make sure oh-my-zsh is installed
[ ! -d ~/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [[ -n $SPIN ]]; then
  DOOT_DIR="$HOME/dotfiles/doots"
else
  DOOT_DIR="$HOME/projects/dotfiles/doots"
fi

# Setup Dotfiles
function setupDotfiles() {
  echo "Installing .aliases for $1..."

  vimrcFile=".vimrc"

  if [[ $1 == 'local' ]]; then
    aliasFile=".aliases.personal"
  else
    aliasFile=".aliases.work"
  fi

  cp "$DOOT_DIR/$aliasFile" $HOME/".aliases"
  cp "$DOOT_DIR/$vimrcFile" $HOME/".vimrc"

  if [[ -d $DOOT_DIR ]] && [[ ! -L $DOOT_DIR ]]; then
    for doot in $(ls -ap $DOOT_DIR | grep -v /); do
      dootname="$(basename "$doot")"
      if [[ $dootname =~ '.aliases' ]]; then
        continue
      fi

      echo "Installing $dootname..."
      target=~/"$dootname"
      [[ -f "$target" ]] && mv "$target" "$target.bak"
      cp "$DOOT_DIR/$dootname" $HOME/"$dootname"
    done
  else
    echo "Can't find directory: $DOOT_DIR."
  fi
}

# Personal or Work?
if [[ $(uname -m) == 'arm64' || -n $SPIN ]]; then
  setupDotfiles 'work'
else
  setupDotfiles 'local'
fi

if [[ ! "$SPIN" ]]; then
  exec zsh
fi
