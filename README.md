# mapbox/homebrew-tap

Homebrew tap for Mapbox's command-line tools.

## Requirements

- macOS or Linux
- [Homebrew](https://brew.sh)

## Installation

Quick install (taps and installs in one step):

```sh
brew install mapbox/tap/mapbox
```

Or tap first, then install:

```sh
brew tap mapbox/tap
brew install mapbox
```

## Formulae

| Formula  | Description                            | Source                                              |
| -------- | --------------------------------------- | ---------------------------------------------------- |
| `mapbox` | Command-line interface for Mapbox APIs  | [mapbox-cli](https://github.com/mapbox/mapbox-cli)   |

## Updating

```sh
brew update
brew upgrade mapbox
```

## Uninstalling

```sh
brew uninstall mapbox
brew untap mapbox/tap
```

## Install stats

Downloads through this tap carry a fixed User-Agent string identifying them as coming from Homebrew, separate from other install methods. It's a constant value — no platform, machine, or personal information is attached — used only to count Homebrew installs alongside other install paths.

## Versioning

Version bumps land as pull requests named `bump-mapbox/vX.Y.Z` (some are opened automatically) and are reviewed like any other change.

## Contributing

Pull requests are welcome. To test a change against your local checkout instead of the last-tapped copy, point Homebrew at it directly:

```sh
brew tap mapbox/tap  # if not already tapped
ln -sfn "$(pwd)" "$(brew --repository)/Library/Taps/mapbox/homebrew-tap"
```

Then, from this checkout:

```sh
brew style Formula/mapbox.rb
brew audit --formula mapbox
brew reinstall mapbox
```

## License

[MIT](LICENSE)

## Support

Found a problem with the CLI itself, rather than this tap? File it at [mapbox-cli/issues](https://github.com/mapbox/mapbox-cli/issues).
