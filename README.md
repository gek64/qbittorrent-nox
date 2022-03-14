## Version
### libtorrent
- `v2.0.5`
### qbittorrent-nox
- `v4.4.1`

## Install prebuilt binaries for freebsd
```sh
# get files
fetch https://github.com/gek64/qbittorrent-nox-freebsd/releases/download/v4.4.1/libtorrent-rasterbar.so.2.0.5
fetch https://github.com/gek64/qbittorrent-nox-freebsd/releases/download/v4.4.1/qbittorrent-nox

# copy to folder
cp libtorrent-rasterbar.so.2.0.5 /usr/local/lib/
cp qbittorrent-nox /usr/local/bin/

# install dependencies 
pkg update && pkg install -y openssl qt5-network qt5-xml qt5-sql

# install app
chmod +x /usr/local/bin/qbittorrent-nox

# install service
fetch https://github.com/gek64/qbtsh/raw/main/service/qbittorrent
mkdir /usr/local/etc/rc.d/
cp qbittorrent /usr/local/etc/rc.d/qbittorrent && chmod +x /usr/local/etc/rc.d/qbittorrent
service qbittorrent enable && service qbittorrent start

# visit http://localhost:8080
```

## Uninstall prebuilt binaries for freebsd
```sh
# uninstall service
service qbittorrent stop && service qbittorrent disable
rm /usr/local/etc/rc.d/qbittorrent

# uninstall dependencies
rm /usr/local/lib/libtorrent-rasterbar.so*
pkg remove -y openssl qt5-network qt5-xml qt5-sql
pkg autoremove -y

# uninstall app
rm -rf /usr/local/bin/qbittorrent-nox

# remove leftover
rm -rf /usr/local/etc/qBittorrent
```

## Compile if no prebuilt binaries available
#### FreeBSD
```sh
fetch https://github.com/gek64/qbittorrent-nox-shared/raw/main/qbittorrent_build_freebsd.sh
chmod +x qbittorrent_build_freebsd.sh
./qbittorrent_build_freebsd.sh
```
#### Linux
```sh
fetch https://github.com/gek64/qbittorrent-nox-shared/raw/main/qbittorrent_build_linux.sh
chmod +x qbittorrent_build_linux.sh
./qbittorrent_build_linux.sh
```

## System requirements
### FressBSD prebuilt binaries
- x64 Architecture CPU
- freebsd 13 and above

### Compile
- Linux or FreeBSD system
- RAM > 2GB
- Disk > 10GB


## License
- **GNU Lesser General Public License v2.1**
- See `LICENSE` for details
