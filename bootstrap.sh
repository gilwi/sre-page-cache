#!/bin/bash

pacman --noconfirm -Sy git base-devel go wget
source /etc/profile

cd /home/vagrant || exit
sudo -u vagrant git clone https://aur.archlinux.org/yay.git
cd yay || exit
sudo -u vagrant makepkg --noconfirm -si

sudo -u vagrant yay --noconfirm -Sy vmtouch

cd /home/vagrant || exit
sudo -u vagrant mkdir kernel
cd kernel || exit
sudo -u vagrant wget https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-5.14.tar.gz
sudo -u vagrant tar -xzf linux-5.14.tar.gz
cd linux-5.14/tools/vm || exit
sudo -u vagrant make
make install

sudo -u vagrant dd if=/dev/random of=/var/tmp/file1.db count=128 bs=1M  
sudo -u vagrant sync; echo 3 | sudo tee /proc/sys/vm/drop_caches