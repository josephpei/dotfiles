## Quick Start on a New Machine
```bash
sh -c "$(curl -fsLS https://raw.githubusercontent.com/josephpei/dotfiles/main/bootstrap.sh)"
```
## Next Steps

1. Clone and customize locally if needed:
```
chezmoi clone https://github.com/josephpei/dotfiles.git
```
2. Test it on your current machine:
```
chezmoi init --apply https://github.com/josephpei/dotfiles.git
```
3. Add your own dotfiles:
```
chezmoi add ~/.myfile
```

Your repository is ready to go! 🚀
