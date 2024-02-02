#!/bin/bash

set -e

WORKDIR="/playtron"
mkdir -p ${WORKDIR}/cache ${WORKDIR}/repo
ostree --repo=${WORKDIR}/repo init --mode=archive-z2
rpm-ostree compose tree --unified-core --cachedir=${WORKDIR}/cache --repo=${WORKDIR}/repo playtron-os.yaml
ostree summary --repo=${WORKDIR}/repo --update
