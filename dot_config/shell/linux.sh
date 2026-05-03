# Linux related
if [ "$OSTYPE" != "linux-gnu" ]; then
    return
fi

if $CLICOLOR; then
    if ! alias ls >/dev/null 2>&1; then
        alias ls='ls --color=auto'
    fi
fi
alias open='xdg-open'
if [ -n "$(command -v wl-copy)" ] && [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    alias pbcopy='wl-copy'
    alias pbpaste='wl-paste'
else
    alias pbcopy='xclip -selection c -i'
    alias pbpaste='xclip -selection c -o'
fi

for dir in "/var/lib/snapd/desktop" "/var/lib/flatpak/exports/share" "$HOME/.local/share/flatpak/exports/share"; do
    if [ -d "$dir" ]; then
        export XDG_DATA_DIRS="$XDG_DATA_DIRS:$dir"
    fi
done
unset dir

export SYSTEMD_LESS="FRXMK"

# extra PATHs
export PATH=$HOME/.local/bin:$PATH
for i in /home/linuxbrew/.linuxbrew $HOME/.linuxbrew /snap /opt/puppetlabs/bin; do
    if [ -d "$i" ]; then
        export PATH="$i/bin:$i/sbin:$PATH"
    fi
done
unset i
