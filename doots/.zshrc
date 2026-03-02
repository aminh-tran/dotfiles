# initialize proper env stuff with brew
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

source $HOME/.aliases

# Show git branch in prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PROMPT='%~${vcs_info_msg_0_} 🏠 → '

if [ -f ~/.aliases.common ]; then . ~/.aliases.common; fi

# Added by tec agent
[[ -x /Users/minhtran/.local/state/tec/profiles/base/current/global/init ]] && eval "$(/Users/minhtran/.local/state/tec/profiles/base/current/global/init zsh)"
