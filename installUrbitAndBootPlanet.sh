#!/bin/bash
# install urbit and boot planet


# get planet and ticket
echo Enter your planet name \(include the tilde and hyphen, e.g. ~mirfet-hocbyt\)
read planetname
echo Enter your ticket \(include the tilde and hyphens here too\)
read ticket


# swap file
sudo fallocate -l 2G /swapfile

ls -lh /swapfile

sudo chmod 600 /swapfile

ls -lh /swapfile

sudo mkswap /swapfile

sudo swapon /swapfile

sudo cp /etc/fstab /etc/fstab.bak


# download source and dependencies then install
sudo apt-get update

yes Y | sudo apt-get install autoconf automake cmake exuberant-ctags g++ git libcurl4-gnutls-dev libgmp3-dev libncurses5-dev libsigsegv-dev libssl-dev libtool make ninja-build openssl pkg-config python python3 python3-pip ragel re2c zlib1g-dev

sudo -H pip3 install --upgrade pip

sudo -H pip3 install meson

git clone https://github.com/urbit/urbit

cd urbit/

./scripts/bootstrap

./scripts/build

sudo ninja -C ./build/ install

urbit


# boot
urbit -w $planetname -t $ticket