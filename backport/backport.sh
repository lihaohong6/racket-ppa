#! /usr/bin/bash

export GPGKEY=$(gpg --list-secret-keys --keyid-format=long | grep "^sec" | sed --regexp-extended 's/.*\/(\w+).*/\1/')
export DEBFULLNAME="Peter Li"
export DEBEMAIL="lihaohong6@gmail.com"
for distro in jammy noble oracular plucky; do
    backportpackage -d "$distro" -u ppa:lihaohong/racket "https://deb.debian.org/debian/pool/main/r/racket/racket_8.16+dfsg1-1.dsc" -k "$GPGKEY"
done
