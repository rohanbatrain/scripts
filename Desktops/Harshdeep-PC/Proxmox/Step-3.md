# Installing windows 10 VM

1. Get your [drivers](https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-virtio/virtio-win.iso) from fedora, we need that later.

# Windows VM

> config location: /etc/pve/qemu-server/100.conf

Config :

```
agent: 1
boot: order=scsi0;net0;ide0
cores: 8
hostpci0: 0000:26:00,pcie=1,x-vga=1
ide0: local:iso/virtio-win.iso,media=cdrom,size=522284K
machine: pc-q35-7.2
memory: 8192
meta: creation-qemu=7.2.0,ctime=1684297962
name: Windows-10
net0: e1000=06:BE:F6:67:62:8A,bridge=vmbr0,firewall=1
numa: 0
ostype: win10
scsi0: local-lvm:vm-100-disk-0,cache=writeback,discard=on,iothread=1,size=100G
scsihw: virtio-scsi-single
smbios1: uuid=b5931ea2-a92f-43ad-885e-a711e81a7267
sockets: 1
usb0: host=046d:c07e
usb1: host=258a:002a
vga: std
vmgenid: 58e7e07f-44b3-4c63-9433-e27d9b574c86
```


## Windows specific documentation

1. Softwares
  1. Chrome
  2. [Spice-Webdav](https://www.spice-space.org/download/windows/spice-webdavd/)
2. ---  

