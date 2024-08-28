#!/bin/zsh

# Make sure oh-my-zsh is installed
[ ! -d ~/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [[ -n $SPIN ]]; then
  DOOT_DIR="$HOME/dotfiles/doots"
else
  DOOT_DIR="$HOME/dotfiles/doots"
fi

# Setup Dotfiles
function setupDotfiles() {
  echo "Installing .aliases for $1..."

  vimrcFile=".vimrc"
  commonAliasFile=".aliases.common"

  if [[ $1 == 'local' ]]; then
    aliasFile=".aliases.personal"
  else
    aliasFile=".aliases.work"
  fi

  cp "$DOOT_DIR/$aliasFile" $HOME/".aliases"
  cp "$DOOT_DIR/$vimrcFile" $HOME/".vimrc"
  cp "$DOOT_DIR/$commonAliasFile" $HOME/".aliases.common"

  if [[ -d $DOOT_DIR ]] && [[ ! -L $DOOT_DIR ]]; then
    for doot in $(ls -ap $DOOT_DIR | grep -v /); do
      dootname="$(basename "$doot")"
      if [[ $dootname =~ '.aliases' ]] || [[ $dootname == '.aliases.common' ]]; then
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

# Update .zshrc to source .aliases.common
function updateZshrc() {
  zshrcFile="$HOME/.zshrc"
  commonAliasSource="if [ -f ~/.aliases.common ]; then . ~/.aliases.common; fi"

  if ! grep -qF "$commonAliasSource" "$zshrcFile"; then
    echo "Adding common aliases source to .zshrc..."
    echo "\n$commonAliasSource" >> "$zshrcFile"
  else
    echo "Common aliases source already present in .zshrc."
  fi
}

# Personal or Work?
if [[ $(uname -m) == 'arm64' || -n $SPIN ]]; then
  setupDotfiles 'work'
else
  setupDotfiles 'local'
fi

updateZshrc

if [[ ! "$SPIN" ]]; then
  exec zsh
fi
