# Playtron OS

- A secure environment designed to load only a single application such as a game launcher.

## Minimum Hardware Requirements

- CPU
    - x86
        - AMD Ryzen or Intel 6th Gen Kaby Lake
- GPU
    - AMD Navi
    - Intel Xe
    - NVIDIA Turing

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

First build the rpm-ostree repository. Optionally build it with local RPMs for testing.

```
$ go-task ostree
```

```
$ mkdir /tmp/repo/
$ cp $RPM /tmp/repo/
$ createrepo /tmp/repo/
$ go-task ostree-rpms
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
