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
