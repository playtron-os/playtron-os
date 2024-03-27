#!/bin/sh

#TODOF40 - When Fedora 40 stable is released, replace "development" with "releases" in the path.
sudo virt-install \
  --connect qemu:///system \
  --virt-type kvm --graphics spice --video vga\
  --name playtron-os \
  --os-variant fedora-unknown \
  --boot uefi \
  --vcpus 4 --ram 16384 \
  --disk=/var/lib/libvirt/images/playtron-os.img,bus=virtio,format=raw,size=8 \
  --location=https://mirror.rackspace.com/fedora/development/40/Everything/x86_64/os/ \
  --initrd-inject ./playtron-os_kickstart.cfg \
  --extra-args="inst.ks=file:/playtron-os_kickstart.cfg net.ifnames=0 biosdevname=0" \
  --noreboot
