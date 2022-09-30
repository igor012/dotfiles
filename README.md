# Dotfiles

My personal dotfiles managed with [Chezmoi](https://www.chezmoi.io/).

## Quick Install

```shell
bash -c <(curl -s https://raw.githubusercontent.com/igor012/dotfiles/refs/heads/main/bootstrap.sh)
```

## What's Included

- Git configuration (personal and professional)
- Zsh configuration with Zim framework
- Terminal configurations (Alacritty, Rio)
- Terminal multiplexers (Tmux, Zellij)
- Shell aliases and functions
- Development tools (pyenv, tfswitch, etc.)
- Various utilities and productivity enhancements

## Manual Installation

1. Install Chezmoi:
   ```
   brew install chezmoi
   ```

2. Initialize with this repository:
   ```
   chezmoi init https://github.com/igor012/dotfiles.git
   ```

3. Apply the dotfiles:
   ```
   chezmoi apply
   ```

## Customization

This configuration supports different environments (personal vs professional) and can be customized by editing the appropriate files after installation.

## Directory Structure

- `home/`: Contains the actual dotfiles (prefixed according to Chezmoi's naming convention)
- `home/dot_config/`: Configuration files that go into ~/.config
- `home/dot_zshrc.d/`: Modular Zsh configuration
- `bootstrap.sh`: Installation script

## Updating

To update your dotfiles after changes to the repository:

```
chezmoi update
```

## License

MIT
