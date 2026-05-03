alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias ln='ln -iv'
alias rsync='rsync --partial --secluded-args --progress --human-readable --info=PROGRESS2'

if [ -n "$(command -v eza)" ]; then
    alias ls='eza --git --icons --color=auto --header --group --mounts'
    alias tree='eza --tree --git --icons --color=auto'
elif [ -n "$(command -v lsd)" ]; then
    alias ls='lsd'
    alias tree='lsd --tree'
fi

if [ -n "$(command -v zoxide)" ]; then
    if [ "$(basename "$SHELL")" = "zsh" ]; then
        eval "$(zoxide init --cmd cd zsh)"
    elif [ -n "$BASH" ]; then
        eval "$(zoxide init --cmd cd bash)"
    fi
fi

if [ -n "$(command -v fnm)" ]; then
    if [ "$(basename "$SHELL")" = "zsh" ]; then
		eval "$(fnm env --use-on-cd --shell zsh)"
	elif [ -n "$BASH" ]; then
		eval "$(fnm env --use-on-cd --shell bash)"
	fi
fi

if [ -n "$(command -v fnm)" ]; then
    if [ "$(basename "$SHELL")" = "zsh" ]; then
		eval "$(uv generate-shell-completion zsh)"
	elif [ -n "$BASH" ]; then
		eval "$(uv generate-shell-completion bash)"
	fi
fi

if [ -n "$(command -v fnm)" ]; then
    if [ "$(basename "$SHELL")" = "zsh" ]; then
        [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
	elif [ -n "$BASH" ]; then
        [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    fi
fi