# PlaytronOS

Read more about PlaytronOS on our official [website](https://www.playtron.one/).

## Minimum Hardware Requirements

- CPU
    - x86
        - AMD Ryzen or Intel 6th Gen Kaby Lake
- GPU (single GPU only)
    - AMD Navi
    - Intel Xe (support coming soon)
    - NVIDIA Turing (support coming soon)

## Build

Install the required build dependencies.

Fedora Atomic Desktop:

```
$ sudo rpm-ostree install \
    go-task \
    qemu-kvm \
    virt-install \
    virt-manager
```

Fedora Workstation:

```
$ sudo dnf install \
    go-task \
    qemu-kvm \
    rpm-ostree \
    virt-install \
    virt-manager
```

Enable and start the `libvirtd` service.

```
$ sudo systemctl enable --now libvirtd
```

Define a tag and then build the base OCI container image archive.

```
$ export TAG=replace-me
$ sudo -E go-task container-image:build-base
```

Import the container image archive.

```
$ go-task container-image:load-base
```

Build an unstable development container image. Alternatively, build a stable container image based on the previous release.

```
$ go-task container-image:build
```

```
$ go-task container-image:build-stable
```

Optionally authenticate to a container registry.

```
$ export REGISTRY=quay.io
$ export PROJECT=playtron-os
$ export REGISTRY_TOKEN="replace-me"
$ go-task container-image:auth
```

Push the image to a container registry and either create a `:testing` tag or a `:latest` tag automatically.

```
$ go-task container-image:push
```

```
$ go-task container-image:release
```

Then build the raw operating system image. Use Virtual Machine Manager (`virt-manager`) to check the installation progress of the `playtron-os` virtual machine.

```
$ sudo -E go-task disk-image
```

## Linux Developer Tips

The default user account is `playtron` with the password `playtron`. It can be accessed by enabling SSH in the Developer page. The IP address will also be listed there. Alternatively, open up a TTY console by pressing `CTRL`, `ALT`, and `F3` at the same time.

```
Settings > Developer > Enable > Enable SSH Access: On
```

```
$ ssh -l playtron $IP_ADDRESS
```

This user has elevated privileges via the use of `sudo`.

```
$ sudo whoami
```

There is no password for the `root` user account. Set one to help with troubleshooting boot issues.

```
$ sudo passwd root
```

Switch to a minimal Weston desktop environment.

```
$ sudo playtronos-session-select dev
```

Switch back to the Playtron experience.

```
$ sudo playtronos-session-select user
```

Enable Flathub.

```
$ flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

Enable LanCache support for Epic Games Store. Steam already supports LanCache. GOG.com does not support LanCache.

```
$ crudini --set ~/.config/legendary/config.ini Legendary disable_https true
```

Create and use a container for development purposes.

```
$ distrobox create --init --additional-packages systemd --image fedora:40 --pull --name fedora40
$ distrobox enter fedora40
```
