#!/bin/bash

# Enable shell debugging.
set -x

rpm-ostree install --cache-only /var/nvidia/*.rpm
systemctl --no-reload disable install-nvidia
reboot
