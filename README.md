# Playtron OS

Playtron provides two builds of Playtron OS:

- **Playtron Game OS** = A secure environment designed to load only a single application such as a game launcher.
- **Playtron Dev OS** = A desktop environment and game developer tools are provided out-of-the-box.

## Build

Playtron OS can be built using any Linux distribution that provides `virt-install`. By default, Playtron Dev OS will be built.

```
$ git clone https://github.com/playtron-os/playtron-os.git
$ cd playtron-os/kickstart/
$ ./virt-install.sh
```
