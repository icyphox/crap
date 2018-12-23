<h1 align="center">
  <img src="https://x.icyphox.sh/15QNk.png" width="280">
</h1>

> `rm` files without fear

### Why?
Ever `rm`ed a file and instantly regretted it? Fear not, for `crap` is here. 

### How?
`crap` follows the FreeDesktop.org Trash spec. So instead of perma-deleting your file, `crap` moves it to the `$XDG_DATA_HOME/Trash` folder. If this environment variable isn't set, it defaults to `~/.local/share/Trash`.

And obviously, ***this works only on Linux***. 

## Installation
```console
$ nimble install crap
```

or download the binary from the [Releases](https://github.com/icyphox/crap/releases/) page.

### Tip
Alias `crap` to `rm` in your `.bashrc`/`.zshrc`. But that's kinda the point.

## Usage
```console
$ crap foo.png

$ crap *.png

$ crap a.pdf b.jpg c.mp4

```
Aaannddd it'll show up in your file manager's Trash.

![trash](https://x.icyphox.sh/H6iNv.png)

## API
This package exposes a single proc: `crap(path: var string)`

```nim
import crap

crap("~/Pictures/*")

```

## TODO
- [x] support multiple files
- [x] trashing dirs
- [ ] support for other OSs (idk maybe)

## Prior art
- [sindresorhus/trash-cli](https://github.com/sindresorhus/trash-cli)

## Contributing
Bad code? New feature in mind? Open an issue. Better still, learn [Nim](https://nim-lang.org/documentation.html) and shoot a PR :sparkles:

## License
MIT © [Anirudh Oppiliappan](https://icyphox.sh)
