# Homebrew Tap for Mitto

This is the official Homebrew tap for [Mitto](https://github.com/inercia/mitto), a CLI client for the Agent Communication Protocol (ACP).

## Installation

```bash
# Add the tap
brew tap inercia/mitto

# Install CLI only (works on macOS and Linux)
brew install mitto

# Install macOS app + CLI (macOS only)
brew install --cask mitto
```

Or install directly without adding the tap:

```bash
# CLI only
brew install inercia/mitto/mitto

# macOS app + CLI
brew install --cask inercia/mitto/mitto
```

## What's Included

| Package | Type | Description |
|---------|------|-------------|
| `mitto` | Formula | CLI tool (`mitto` command) |
| `mitto` | Cask | macOS desktop app (Mitto.app) + CLI |

## Updating

```bash
brew update
brew upgrade mitto
```

## More Information

- [Mitto Repository](https://github.com/inercia/mitto)
- [Mitto Releases](https://github.com/inercia/mitto/releases)
