#!/bin/sh
mount -o loop /tmp/VBoxGuestAdditions.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm /tmp/VBoxGuestAdditions.iso
