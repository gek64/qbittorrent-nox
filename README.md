# qbittorrent-nox-shared
- `libtorrent` shared build
- `qbittorrent-nox` shared build

## Install
```sh
# get files
fetch https://github.com/gek64/qbittorrent-nox-shared/releases/download/v4.4.1/libtorrent_freebsd.zip
fetch https://github.com/gek64/qbittorrent-nox-shared/releases/download/v4.4.1/qbittorrent_freebsd.zip

# unzip
unzip libtorrent_freebsd.zip
unzip qbittorrent_freebsd.zip

# copy to folder
cp static/lib/libtorrent-rasterbar.so.2.0.5 /usr/local/lib/
cp static/bin/qbittorrent-nox /usr/local/bin/

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
