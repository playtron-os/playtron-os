# Playtron OS

- A secure environment designed to load only a single application such as a game launcher.

## Hardware Requirements

These are the minimum hardware requirements we recommend for ideal gaming experiences. However, older hardware may also work but are subject to performance and graphical issues.

1080p gaming:
- Dual-core CPU
    - AMD Ryzen, Intel 6th Gen Kaby Lake, or newer
- 8 GB RAM
- GPU with 6 GB VRAM
    - AMD Navi or newer
    - Intel Xe or newer
    - NVIDIA Turing or newer
- HDD drive

4K gaming:
- Quad-core CPU
    - AMD Ryzen, Intel 6th Gen Kaby Lake, or newer
- 16 GB RAM
- GPU with 12 GB VRAM
    - AMD Navi or newer
    - Intel Xe or newer
    - NVIDIA Turing or newer
- NVMe drive

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

First build the rpm-ostree repository.

```
$ go-task ostree
```

Then build the operating system image. Either use the remote rpm-ostree repository or a local one built from the previous task. Use Virtual Machine Manager (`virt-manager`) to check the installation progress of the `playtron-os` virtual machine.

```
$ go-task image-remote
```

```
$ go-task image-local
```

Alternatively, both the `ostree` and `image-local` tasks can be ran at the same time to do a full end-to-end build.

```
$ go-task all
```
