FROM centos:7

ARG ISO_FILE=/iso/centos7-net-x86_64.iso
ARG RSYNC_URL=rsync://ftp.riken.jp/centos/7.6.1810/

RUN yum -y install genisoimage pykickstart rsync &&\
    yum clean all &&\
    rm -rf /var/cache/yum/*

RUN mkdir -p /cdrom/ &&\
    rsync -Raz --stats "${RSYNC_URL}/os/x86_64/./LiveOS/squashfs.img" /cdrom/ &&\
    rsync -Raz --stats "${RSYNC_URL}/os/x86_64/./isolinux/" /cdrom/ --exclude isolinux.cfg

ADD ks.cfg /cdrom/
ADD isolinux/isolinux.cfg /cdrom/isolinux/

ENV ISO_FILE $ISO_FILE

CMD ksvalidator -v RHEL7 /cdrom/ks.cfg &&\
    mkisofs \
      -o "$ISO_FILE" \
      -b isolinux/isolinux.bin \
      -c isolinux/boot.cat \
      -no-emul-boot \
      -boot-load-size 4 \
      -boot-info-table \
      -r -J -v \
      /cdrom/
