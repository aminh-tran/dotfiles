# initialize proper env stuff with brew
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# Shopify default zshrc has some good stuff
if [ -n "$SPIN" ]; then
	source /etc/zsh/zshrc.default.inc.zsh
fi

# Check if local or on spin for PROMPT
am_i_spun() {
	if [[ "${SPIN}" ]]; then
		echo "🌀"
	else
		echo "🏠"
	fi
}

source $HOME/.aliases

if [ ! -n "$SPIN" ]; then
	source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
fi

# Add local or spin stuff to prompt
# PROMPT+="$(am_i_spun) -> "
