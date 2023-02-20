#!/bin/sh

sudo virt-install \
  --connect qemu:///system \
  --virt-type kvm --graphics spice --video vga\
  --name playtron-dev-os \
  --os-variant fedora37 \
  --vcpus 4 --ram 16384 \
  --disk=/var/lib/libvirt/images/playtron-dev-os.img,bus=virtio,format=raw,size=64 \
  --location=https://mirror.rackspace.com/fedora/releases/37/Everything/x86_64/os/ \
  --initrd-inject ./playtron-dev-os_kickstart.cfg \
  --extra-args="inst.ks=file:/playtron-dev-os_kickstart.cfg net.ifnames=0 biosdevname=0"
