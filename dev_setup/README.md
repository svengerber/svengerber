# How to setup

Dotfiles are managed with [chezmoi](https://www.chezmoi.io/). The chezmoi
source lives in [`home/`](../home) (see [`.chezmoiroot`](../.chezmoiroot)); the
rest of this repo (profile README, fonts, keyboard layout, PowerShell, Windows
Terminal) is ignored by chezmoi.

## Windows

```powershell
./powershell/windows_base.ps1
```

Fonts are in [`fonts/`](../fonts), the keyboard layout installer in
[`keyboard/built/`](../keyboard/built), and the Windows Terminal settings in
[`windows_terminal.json`](windows_terminal.json).

## WSL / Linux

1. Copy personal SSH keys (never stored in this repo):

   ```bash
   mkdir -p ~/.ssh && cp id_* ~/.ssh
   chmod 600 ~/.ssh/id_*
   chmod 644 ~/.ssh/*.pub
   ```

2. Install chezmoi and apply:

   ```bash
   sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin
   ~/.local/bin/chezmoi init --apply https://github.com/svengerber/svengerber.git
   ```

   On WSL you are asked once for the Windows home path (default
   `/mnt/c/Users/Sven Gerber`). The first apply installs the toolchain
   (kubectl, helm, flux, starship, kubectx/kubens, kubie, zsh), clones
   oh-my-zsh + plugins + fzf, and writes the dotfiles.

3. On WSL, run `wsl --shutdown` from Windows once so `/etc/wsl.conf` takes
   effect.

### Machine-local config (not tracked)

This repo is public, so work/customer-specific bits stay local. chezmoi
creates these as commented stubs on first apply and never overwrites them
afterwards (`create_` prefix), so fill them in by hand on each machine:

| File | Picked up by |
|---|---|
| `~/.ssh/config.d/*` (stub: `00-local`) | `Include config.d/*` at the top of `~/.ssh/config` |
| `~/.zshrc.local` | sourced at the end of `~/.zshrc` |
| `~/.gitconfig.local` | `[include]` at the end of `~/.gitconfig` |

## Daily use

```bash
chezmoi diff              # what would change
chezmoi apply             # write changes to ~
chezmoi edit ~/.zshrc     # edit the source, then apply
chezmoi re-add            # pull edits made directly in ~ back into the source
chezmoi cd                # shell in the source repo -> git commit / push
chezmoi update            # git pull + apply
```

What's managed: `.zshrc`, `.gitconfig*`, `.ssh/config`, `.kube/kubie.yaml`,
`.config/starship.toml`, `.config/git/ignore`, `bin/claude-notify` (WSL only).
