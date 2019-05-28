#!/bin/sh

chmod a+x xyz.skylarmccauley.preferenceutility/preferenceutility/data/restore.sh
chmod a+x xyz.skylarmccauley.preferenceutility/usr/bin/prefutility
chmod 0555 xyz.skylarmccauley.preferenceutility/DEBIAN/postinst

find . -name ".DS_Store" -delete

dpkg -b xyz.skylarmccauley.preferenceutility

