# CentOS auto install ISO

## 概要

CentOS 7 を自動インストールする iso イメージです。
この iso イメージからブートすると自動的に CentOS がディスクにインストールされます。

## メモ

inst.stage2 を指定せずに squashfs.img までネットワーク経由にするとかなり時間がかかるのと、
initramfs にダウンロードするためメモリが 2GB 程度必要になるため、squashfs.img は ISO に含めました。

## 参考

 - https://access.redhat.com/documentation/ja-jp/red_hat_enterprise_linux/7/html/installation_guide/chap-kickstart-installations
 - http://fedoraproject.org/wiki/Anaconda/Kickstart
 - http://ken-etsu-tech.blogspot.jp/2008/01/anaconda-kickstartpost.html
