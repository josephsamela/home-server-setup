# home-server-setup

*Setup instructions for my home server*

## Server

The server is a `Dell Precision T1650` with the following specifications.

```
            .-/+oossssoo+/-.               josephsamela@dipper
        `:+ssssssssssssssssss+:`           -------------------
      -+ssssssssssssssssssyyssss+-         OS: Ubuntu 18.04.4 LTS x86_64
    .ossssssssssssssssssdMMMNysssso.       Host: Precision T1650 01
   /ssssssssssshdmmNNmmyNMMMMhssssss/      Kernel: 4.15.0-96-generic
  +ssssssssshmydMMMMMMMNddddyssssssss+     Uptime: 2 days, 8 hours, 12 mins
 /sssssssshNMMMyhhyyyyhmNMMMNhssssssss/    Packages: 1426
.ssssssssdMMMNhsssssssssshNMMMdssssssss.   Shell: bash 4.4.20
+sssshhhyNMMNyssssssssssssyNMMMysssssss+   Terminal: /dev/pts/0
ossyNMMMNyMMhsssssssssssssshmmmhssssssso   CPU: Intel i3-2120 (4) @ 3.300GHz
ossyNMMMNyMMhsssssssssssssshmmmhssssssso   GPU: AMD Radeon HD 6450/7450/8450
+sssshhhyNMMNyssssssssssssyNMMMysssssss+   Memory: 5172MiB / 13975MiB
.ssssssssdMMMNhsssssssssshNMMMdssssssss.
 /sssssssshNMMMyhhyyyyhdNMMMNhssssssss/
  +sssssssssdmydMMMMMMMMddddyssssssss+
   /ssssssssssshdmNNNNmyNMMMMhssssss/
    .ossssssssssssssssssdMMMNysssso.
      -+sssssssssssssssssyyyssss+-
        `:+ssssssssssssssssss+:`
            .-/+oossssoo+/-.
```

Notes
* The CPU is a `i3-2120` that supports `vt-d`. Support for `vt-d` is required for virtualization. Make sure to check `vt-d` is enabled in UEFI during installation.
* The server has three hard drives. One `256GB` SSD for the operating system. Two `8TB` SATA hard drives for bulk storage.

## Host

### Operating System:

Install the latest `Ubuntu LTS` operating system. During installation create an administrator account and configure a static ip address.

### Software:

On the host, install updates and upgrades then install the following software:

* `copilot` admin web-interface for managing the server remotely.
* `docker` tool for running running web services as containers.
* `zfs` support for zfs filesystems. Used to create mirror RAID on the two `8TB` hard drives.

## Containers:

Below is the list of containers running on the host.

### `bastion`

This container runs an nginx reverse/proxy for [https://samela.io](https://samela.io) handling routes from the primary domain to all the other containerized web services.

### `plex`

This runs plex web interface for watching the media collection at `/share/Library`.

### `samba`

This runs the smb network fileshare on the local area network. The `/share` folder on the host is mounted inside the container. The   `samba.conf` allows guest read access and authenticated read-write access.

### `feed`

This is a nginx file browser for the media files in `/share/Library`. The browser requires username/password authentication and is read-only.

### `sandbox`

This is an "always-running" container of Ubuntu that can be ssh'd into for network testing.
