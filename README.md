# Playtron OS

- A secure environment designed to load only a single application such as a game launcher.

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

First build the OCI container.

```
$ go-task container-image
```

Then build the operating system image. Either use the remote rpm-ostree repository or a local one built from the previous task. Use Virtual Machine Manager (`virt-manager`) to check the installation progress of the `playtron-os` virtual machine.

```
$ go-task disk-image
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
