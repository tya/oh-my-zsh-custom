# tynet-omz

Framework-free zsh configuration. Formerly an [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
`ZSH_CUSTOM` dir; oh-my-zsh has been removed for startup speed (~580ms → well under
100ms). Completion, keybindings, and the prompt are now provided directly.

## Setup

`~/.zshrc` only needs:

```zsh
[[ -d "$HOME/.tynet-omz" ]] || git clone https://github.com/tya/tynet-omz "$HOME/.tynet-omz"
source "$HOME/.tynet-omz/init.zsh"
```

Homebrew's environment must be set before this runs — keep
`eval "$(/opt/homebrew/bin/brew shellenv)"` in `~/.zprofile` (login shells).

Recommended Homebrew packages:

```
brew install zsh-fast-syntax-highlighting zsh-completions fzf
# optional: brew install zsh-autosuggestions displayplacer duti
```

## Layout

```
init.zsh              entry point: OS detection, ordered sourcing, PATH de-dupe
lib/
  plugins.zsh         fpath wiring + fast-syntax-highlighting helper (no `brew` fork)
  compinit.zsh        completion system: daily audit, cached dump, async zcompile
  prompt.zsh          hand-rolled prompt (rule + timestamp / user@host / cwd / git)
domains/
  00-core.zsh         every host: shell opts, keybindings, aliases, functions, PATH
  10-macos.zsh        $TYNET_OS == osx: BSD ls, command-not-found, Ghostty→MacVim
  10-linux.zsh        $TYNET_OS == linux: GNU ls
  20-personal.zsh     every host: dotfiles `cg`, personal cd aliases
  30-tools.zsh        every host: fzf, op, kubectl, goenv (lazy), docker, tmux, …
  50-work.zsh         opt-in only (see below)
functions/            extensionless files, autoloaded via fpath (e.g. setup-displays)
```

### Domain selection

`init.zsh` sources, in lexical order:

- `domains/00-*.zsh` and `domains/20-*.zsh` — always
- `domains/10-<os>.zsh` — where `<os>` is `osx` or `linux`
- `domains/*-<name>.zsh` — for each bare `<name>` listed (one per line) in
  `~/.config/tynet/domains`. Example: `echo work >> ~/.config/tynet/domains`
- `domains/<shorthostname>.zsh` — if present, loaded last (per-machine overrides)

Add a new domain by dropping a `NN-name.zsh` file in `domains/`. Use a numeric
prefix to place it in load order (`00` core → `50` late); pick `20`–`40` for most.

## Conventions

- One file per domain, sectioned `exports → shell options → keybindings →
  PATH → aliases → functions`.
- Platform branches use `$TYNET_OS` (`osx` / `linux`); `$OS` is kept as a legacy
  alias. Both are set in `init.zsh` **before** any domain loads, so unlike the old
  layout they are safe to read in an `aliases` section.
- Optional tools are guarded with `command -v`. Heavy inits are lazy (`goenv`) or
  cached to `~/.cache/tynet/<tool>-completion.zsh`.
- fast-syntax-highlighting is sourced **last**, by `init.zsh`, after PATH de-dupe.
- `TYNET_PROFILE=1 zsh -i -c exit` prints a `zprof` report.

## Prompt

```
──────────────────────────────────────────────────  2026-09-01 14:23:05
ty@air15  ~/src/tynet-omz  ‹master*›
❯
```

Rule + right-aligned timestamp, then `user@host`, cwd, and git branch with dirty
markers (`*` unstaged, `+` staged). Prompt char turns red after a failed command.
Git status comes from `vcs_info`; if it feels slow in a very large repo:

```zsh
zstyle ':vcs_info:git:*' check-for-changes false
```
