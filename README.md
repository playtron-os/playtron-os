# Playtron OS

Playtron provides two builds of Playtron OS:

- **Playtron Game OS** = A secure environment designed to load only a single application such as a game launcher.
- **Playtron Dev OS** = A desktop environment and game developer tools are provided out-of-the-box.

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
$ cd /tmp/
$ sudo python -m http.server
```

Playtron OS can be built using any Linux distribution that provides `virt-install`. By default, Playtron Dev OS will be built.

```
$ cd <PLAYTRON_OS_GIT_DIRECTORY>/kickstart/
$ sudo ./virt-install.sh
```
