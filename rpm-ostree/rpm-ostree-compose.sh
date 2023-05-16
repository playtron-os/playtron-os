#!/bin/bash

WORKDIR="/root/tmp"
mkdir -p ${WORKDIR}/cache ${WORKDIR}/repo
sudo ostree --repo=${WORKDIR}/repo init --mode=archive-z2
sudo rpm-ostree compose tree --unified-core --cachedir=${WORKDIR}/cache --repo=${WORKDIR}/repo playtron-dev-os.yaml
sudo ostree summary --repo=${WORKDIR}/repo --update
