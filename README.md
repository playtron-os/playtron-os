# Playtron OS

Playtron provides two builds of Playtron OS:

- **Playtron Game OS** = A secure environment designed to load only a single application such as a game launcher.
- **Playtron Dev OS** = A desktop environment and game developer tools are provided out-of-the-box.

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

First build the rpm-ostree OCI image.

```
$ git clone https://github.com/playtron-os/playtron-os.git
$ cd playtron-os/rpm-ostree/
$ sudo ./rpm-ostree-compose.sh
$ cd ..
```

In a different terminal session, temporarily turn off conflicting services and then start a HTTP server.

```
$ sudo setenforce 0
$ sudo systemctl stop firewalld
$ sudo systemctl restart libvirtd
```

```
$ sudo su -
$ cd /root/tmp/
$ python -m http.server
```

Playtron OS can be built using any Linux distribution that provides `virt-install`. By default, Playtron Dev OS will be built.

```
$ cd <PLAYTRON_OS_GIT_DIRECTORY>/kickstart/
$ sudo ./virt-install.sh
```
