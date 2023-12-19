#!/bin/bash -ex

if [[ ! -f /.dockerenv ]] && [[ ! -f /run/.containerenv ]] ; then
    (podman kill deb_build && sleep 2) || true
    podman run -ti --rm --name deb_build --mount type=bind,source="$(pwd)",target=/work -w /work debian_build:testing-slim ./build.sh 
    exit
fi

rm -rf out/*

export EMAIL="Mihai Craiu <mihaiush@gmail.com>"

cp /etc/apt/sources.list.d/debian.sources /etc/apt/sources.list.d/debian-src.sources
sed -ri 's/Types: deb/Types: deb-src/g' /etc/apt/sources.list.d/debian-src.sources
apt-get update

cd /tmp
apt-get source bluez-alsa-utils

cd bluez-alsa-*
sed -ri 's/dh_auto_configure --/dh_auto_configure -- --enable-aac/' debian/rules
sed -ri 's/^Build-Depends: /Build-Depends: libfdk-aac-dev, /g' debian/control
dch -i "Enable extra codecs"
dch -r ""
echo | mk-build-deps -i
debuild -uc -us -b

cd /work
cp -v /tmp/*.deb out/
chown --reference=README.md -R out
