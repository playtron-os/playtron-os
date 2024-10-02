#!/bin/bash

# Enable shell debugging.
set -x

rpm-ostree install /var/nvidia/*.rpm
reboot
