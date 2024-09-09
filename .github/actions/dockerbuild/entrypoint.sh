#!/bin/bash
su - builder -c "git clone https://aur.archlinux.org/i686-elf-binutils-bin.git && cd i686-elf-binutils-bin && makepkg"
pacman -U --noconfirm /home/builder/i686-elf-binutils-bin/*.tar.zst 

if [[ ! -z "$1" ]]; then
    cd "$1"
fi

echo "Running makepkg from $PWD"
ls -la

pkg_deps=$(source ./PKGBUILD && echo ${makedepends[@]} ${depends[@]})
echo "Installing dependencies: $pkg_deps"
yay -Syu --noconfirm $pkg_deps

chown -R builder "$PWD"

echo "Running makepkg"

# TODO: support extra flags

su - builder -c "cd $(pwd); gpg --recv-keys $2; makepkg -fs ./PKGBUILD"

echo "Running namcap"

namcap -i *.pkg.tar.zst
