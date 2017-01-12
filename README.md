# libtorrent-ios-resources
Some resources for compiling libtorrent on iOS

# Compiling

## ...with a pre-configured Xcode project
- See [chublix/libtorrent-ios](https://github.com/chublix/libtorrent-ios)

## ...with Qt Creator
- See [libtorrent.pro](libtorrent.pro)

## ...with a Bash Script
- See [the build-script directory](build-script)
```bash
make boost
make openssl
make (all) # Add libtorrent to src/libtorrent before launching
```

# License
MIT

# Authors
- JC Pastant
- Julien Datour
- Michaël Caylus
- Simone Civetta
