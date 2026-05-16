# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io) for seamless configuration across macOS, Ubuntu, and Arch Linux.

## Quick Start

### On a new machine (one-liner):

```bash
sh -c "$(curl -fsLS https://raw.githubusercontent.com/josephpei/dotfiles/main/bootstrap.sh)"
```

This will:
- Detect your OS (macOS, Ubuntu, or Arch Linux)
- Install chezmoi if not present
- Clone this repository
- Apply all configurations automatically
- Install platform-specific packages
- Setup shell environment and git

### Manual setup:

1. Install chezmoi:
   ```bash
   sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin
   ```

2. Initialize:
   ```bash
   ~/.local/bin/chezmoi init --apply https://github.com/josephpei/dotfiles.git
   ```

## Next Steps

### 1. Verify Applied Changes
```bash
chezmoi status          # See which files differ from dotfiles
chezmoi diff           # Preview what changes would be applied
```

### 2. Customize for Your Machine
Edit the chezmoi configuration:
```bash
chezmoi edit .chezmoi.yaml
```

Add your email, name, and other preferences when prompted.

### 3. Add Your Own Dotfiles
Add existing configuration files:
```bash
chezmoi add ~/.bashrc
chezmoi add ~/.zshrc
chezmoi add ~/.vimrc
chezmoi add ~/.config/nvim
```

### 4. Make Changes and Update
When you modify a dotfile on your machine:
```bash
chezmoi status                 # See what changed
chezmoi diff ~/.gitconfig      # See specific diff
chezmoi apply                  # Sync from dotfiles repo
```

### 5. Update Across All Machines
```bash
chezmoi update                 # Pull latest changes and apply
```

## Common Commands

```bash
chezmoi status          # See which files differ from dotfiles
chezmoi diff            # See what changes would be applied
chezmoi apply           # Apply pending changes
chezmoi update          # Pull and apply latest changes from GitHub
chezmoi add ~/.myfile   # Add a new file to chezmoi
chezmoi edit ~/.myfile  # Edit a file in chezmoi
chezmoi remove ~/.myfile # Stop tracking a file
chezmoi re-add ~/.myfile # Update tracked file content
chezmoi managed         # List all managed files
```

## Platform Support

- 🍎 macOS (Intel & Apple Silicon)
- 🐧 Ubuntu 20.04+
- 🐲 Arch Linux

## What's Included

### Shell Configuration
- zsh with Oh My Zsh
- powerlevel10k theme
- zsh-autosuggestions plugin
- zsh-syntax-highlighting plugin
- Useful aliases and utility functions

### Development Tools
- Git configuration with SSH key generation
- Global .gitignore
- Cross-platform package managers

### Automatic Setup
- Platform detection and initialization
- Automatic package installation per OS:
  - **macOS**: Homebrew + Brewfile packages
  - **Ubuntu**: apt packages
  - **Arch Linux**: pacman packages (nvm, uv, etc.)
- SSH key generation
- Shell environment setup

## Customization

### Per-Machine Configuration
Edit `.chezmoi.yaml.tmpl` to customize variables:
```yaml
data:
  email: "your.email@example.com"
  name: "Your Name"
  # OS-specific flags available:
  # isDarwin, isLinux, isUbuntu, isArchLinux
```

### Adding Tools
- **macOS**: Add to `install/Brewfile`
- **Ubuntu**: Add to `install/packages-ubuntu.txt`
- **Arch Linux**: Add to `install/packages-arch.txt`

### Modifying Configurations
Edit files in `home/` directory. Common files:
- `home/.gitconfig.tmpl` - Git configuration
- `home/.config/shell/.zshrc` - Zsh configuration
- `home/.config/shell/aliases.sh` - Shell aliases

## Troubleshooting

### Chezmoi not updating a file?
```bash
chezmoi forget ~/.myfile  # Stop tracking
chezmoi add ~/.myfile     # Re-add it
```

### Want to see what will change before applying?
```bash
chezmoi diff              # Safe to review
```

### Rolling back changes
```bash
chezmoi revert            # Undo last changes
```

### Run setup scripts manually
```bash
~/.local/share/chezmoi/.chezmoiscripts/run_once_init-system.sh
```

## Directory Structure

```
dotfiles/
├── bootstrap.sh                    # One-line setup script
├── .chezmoi.yaml.tmpl             # Chezmoi configuration
├── .chezmoiignore                 # Files to ignore
├── home/                          # Dotfiles to deploy
│   ├── .chezmoiscripts/           # Automatic setup scripts
│   ├── .config/
│   ├── .gitconfig.tmpl
│   └── .gitignore_global
├── install/                       # Package lists
│   ├── Brewfile                   # macOS packages
│   ├── packages-ubuntu.txt
│   └── packages-arch.txt
└── README.md
```

## Tips & Best Practices

1. **Keep sensitive data out** - Never commit passwords or tokens. Use templates with `promptString`.
2. **Test before pushing** - Use `chezmoi diff` to preview changes.
3. **Use templates** - File names ending in `.tmpl` are templated (e.g., `.gitconfig.tmpl`).
4. **Regular updates** - Run `chezmoi update` regularly to keep machines in sync.
5. **Version control** - Commit changes to git: `git -C ~/.local/share/chezmoi add file && git -C ~/.local/share/chezmoi commit -m "message"`

## Resources

- [Chezmoi Documentation](https://www.chezmoi.io)
- [Chezmoi GitHub](https://github.com/twpayne/chezmoi)
- [Awesome Dotfiles](https://github.com/webpro/awesome-dotfiles)

---

**Happy dotfile managing!** 🚀
