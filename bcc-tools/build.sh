#! /bin/bash

pwd=$PWD
cd "$(dirname "$0")"

distro=$1
if [ ! -e ../_docker/$distro/config.sh ]; then
    echo ../_docker/$distro/config.sh not found
    echo $0 distro:
    ls ../_docker
    exit 1
fi
if  [ $distro == "centos7-build" ];then
    img_tag=harbor.smartx.com/kernel/centos-$(uname -m):7
elif [[ $distro =~ "euler-2003-build" ]]; then
    img_tag=harbor.smartx.com/kernel/openeuler-$(uname -m):20.03-lts-sp3
fi

echo $img_tag
rm -rf rpmbuild
mkdir -p rpmbuild/RPMS
docker pull $img_tag
docker run  --rm -v $PWD:$PWD --net=host $img_tag \
    yum --disableplugin=fastestmirror install -y --downloadonly --downloaddir=$PWD/rpmbuild/RPMS bcc-tools
    # yumdownloader --destdir=$PWD/rpmbuild/RPMS --resolve bcc-tools
