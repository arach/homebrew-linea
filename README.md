# Linea Homebrew Tap

Official Homebrew tap for [Linea](https://www.uselinea.com) for Mac.

## Installation

Install Linea with a single command (Homebrew will tap automatically):

```sh
brew install --cask arach/linea/linea
```

### Upgrading Linea

```sh
brew upgrade --cask linea
```

### Already Have Linea Installed?

If you previously installed Linea via direct download DMG or the web installer, Homebrew will pause by default to prevent accidental overwrite:

```sh
# To adopt your existing Linea.app under Homebrew management:
brew install --cask --adopt arach/linea/linea

# Or to force overwrite with the latest verified cask release:
brew install --cask --force arach/linea/linea
```

Or tap first, then install:

```sh
brew tap arach/linea
brew install --cask linea
```

In a `Brewfile`:

```ruby
tap "arach/linea"
cask "linea"
```

## About Linea

Linea is a reading workspace where text becomes audio and highlights become conversations.
Universal binary signed and notarized by Apple for Apple Silicon and Intel Macs running macOS 14 (Sonoma) or later.

- [Website](https://www.uselinea.com)
- [Downloads](https://download.uselinea.com)

To remove Linea:

```sh
brew uninstall --cask linea
```
