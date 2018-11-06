# crap
> `rm` files without fear

### Why?
Ever `rm`ed a file and instantly regretted it? Fear not, for `crap` is here. 

### How?
`crap` follows the FreeDesktop.org Trash spec. So instead of perma-deleting your file, `crap` moves it to the `$XDG_DATA_HOME/Trash` folder. If this environment variable isn't set, it defaults to `~/.local/share/Trash`.

And obviously, *this works only on Linux*. 

## Installation
`nimble install https://github.com/icyphox/crap`  
or download the binary from the [Releases](https://github.com/icyphox/crap/releases/) page.

Optionally, alias it to `rm`. But that's kinda the point.

## Usage
```console
$ crap foo.png
```
Aaannddd it'll show up in your file manager's Trash.

![trash](https://x.ph0x.me/H6iNv.png)

## TODO
- [x] support multiple files
- [x] trashing dirs
- [ ] support for other OSs (idk maybe)

## Prior art
- [sindresorhus/trash-cli](https://github.com/sindresorhus/trash-cli)
