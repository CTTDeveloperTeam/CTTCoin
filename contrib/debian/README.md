
Debian
====================
This directory contains files used to package cryptoinvestd/cryptoinvest-qt
for Debian-based Linux systems. If you compile cryptoinvestd/cryptoinvest-qt yourself, there are some useful files here.

## cryptoinvest: URI support ##


cryptoinvest-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install cryptoinvest-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your cryptoinvestqt binary to `/usr/bin`
and the `../../share/pixmaps/cryptoinvest128.png` to `/usr/share/pixmaps`

cryptoinvest-qt.protocol (KDE)

