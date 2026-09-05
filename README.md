# Linea Homebrew Tap

Official Homebrew tap for [Linea](https://www.uselinea.com) for Mac.

## Installation

Install Linea with a single command (Homebrew will tap automatically):

```sh
brew install --cask arach/linea/linea
```

*Note: If an older or unmanaged copy of Linea is already installed in `/Applications`, Homebrew will automagically upgrade it to the managed release without requiring manual cleanup.*

### Upgrading Linea

Linea automatically updates with Homebrew when new releases are published:

```sh
brew upgrade --cask linea
# or run routine system upgrades
brew upgrade
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
