#!/bin/bash
set -e

echo "🚀 Starting chezmoi bootstrap..."

detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "darwin"
    elif grep -qi ubuntu /etc/os-release 2>/dev/null; then
        echo "ubuntu"
    elif grep -qi arch /etc/os-release 2>/dev/null; then
        echo "archlinux"
    else
        echo "linux"
    fi
}

OS=$(detect_os)
echo "📦 Detected OS: $OS"

if ! command -v chezmoi &> /dev/null; then
    echo "📥 Installing chezmoi..."
    sh -c "
$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin
    export PATH="$HOME/.local/bin:$PATH"
fi

echo "⚙️  Initializing chezmoi..."
chezmoi init --apply https://github.com/josephpei/dotfiles.git

echo "✅ Bootstrap complete!"
echo "📝 Run 'chezmoi status' to see managed files"
echo "🔄 Run 'chezmoi update' to pull latest changes