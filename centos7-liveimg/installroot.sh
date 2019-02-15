#!/bin/sh

set -eux

rsync /etc/yum.repos.d/CentOS* /rootfs/ -Rav
cp /etc/resolv.conf /rootfs/etc/resolv.conf
yum -y --installroot=/rootfs/ --releasever=7 install @core kernel grub2 authconfig mdadm lvm2
yum -y --installroot=/rootfs/ --releasever=7 clean all
rm -f /rootfs/etc/resolv.conf
tar czf /cdrom/rootfs.tgz --directory /rootfs/ .
rm -fr /rootfs/
