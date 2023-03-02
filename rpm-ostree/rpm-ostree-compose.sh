#!/bin/bash

WORKDIR=/tmp
mkdir -p ${WORKDIR}/cache ${WORKDIR}/repo
sudo ostree --repo=${WORKDIR}/repo init --mode=archive-z2
sudo rpm-ostree compose tree --unified-core --cachedir=${WORKDIR}/cache --repo=${WORKDIR}/repo fedora-silverblue.yaml
sudo ostree summary --repo=${WORKDIR}/repo --update
