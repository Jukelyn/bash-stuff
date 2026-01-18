# Bash Stuff

Remove anything in `/etc/update-motd.d/` if that's there, along with any other motd related files or scripts.

Ubuntu uses netplan, example:

```
network:
  version: 2
  renderer: networkd
  ethernets:
    enp4s0:
      dhcp4: no
      match:
        macaddress: 2a:ab:55:32:be:f9
      set-name: enp4s0
      addresses:
        - 192.168.8.150/24
      routes:
        - to: default
          via: 192.168.8.1
      nameservers:
        addresses:
          - 192.168.8.46
          - 9.9.9.9
```
