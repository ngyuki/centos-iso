FROM centos:7

ARG ISO_FILE=/iso/centos7-minimal-x86_64.iso
ARG ISO_URL=http://ftp.riken.jp/Linux/centos/7.6.1810/isos/x86_64
ARG ISO_ORIG=CentOS-7-x86_64-Minimal-1810.iso

RUN yum -y install genisoimage pykickstart epel-release &&\
    yum -y install xorriso &&\
    yum clean all &&\
    rm -rf /var/cache/yum/*

ENV ISO_URL $ISO_URL
ENV ISO_ORIG $ISO_ORIG

RUN mkdir -p /cdrom/ &&\
    curl -fsSL "$ISO_URL/$ISO_ORIG" -o "$ISO_ORIG" &&\
    xorriso -osirrox on -indev "$ISO_ORIG" -extract / /cdrom/ &&\
    rm -f "$ISO_ORIG"

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

