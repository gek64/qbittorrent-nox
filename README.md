# Version
- `libtorrent`:`v2.0.5`
- `qbittorrent-nox`:`v4.4.1`

## Install
```sh
# get files
fetch https://github.com/gek64/qbittorrent-nox-freebsd/releases/download/v4.4.1/libtorrent-rasterbar.so.2.0.5
fetch https://github.com/gek64/qbittorrent-nox-freebsd/releases/download/v4.4.1/qbittorrent-nox

# copy to folder
cp libtorrent-rasterbar.so.2.0.5 /usr/local/lib/
cp qbittorrent-nox /usr/local/bin/

# install dependencies 
pkg update && pkg install -y openssl qt5-network qt5-xml qt5-sql

# test run
chmod +x /usr/local/bin/qbittorrent-nox
/usr/local/bin/qbittorrent-nox -v
```

## Compile
### How to compile if prebuilt binaries can not run
```sh
fetch https://github.com/gek64/qbittorrent-nox-shared/raw/main/qbittorrent_build_freebsd.sh
chmod +x qbittorrent_build_freebsd.sh
./qbittorrent_build_freebsd.sh
ls qbittorrent*.zip libtorrent*.zip
```

## System Requirements
### Prebuilt Binaries
- x64 Architecture CPU
- freebsd version tested on freebsd 13

### Compile
- Any architecture CPU
- RAM > 4GB (recommend)
- Disk > 10GB (recommend)


## License
- **GNU Lesser General Public License v2.1**
- See `LICENSE` for details
