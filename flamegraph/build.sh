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
source ../_docker/$distro/config.sh 

rm -rf rpmbuild
mkdir -p rpmbuild/SOURCES
mkdir -p rpmbuild/SPECS

cp *.spec rpmbuild/SPECS
cp flamegraph-1.0.tar.gz rpmbuild/SOURCES

docker pull $img_tag
docker run  --rm -v $PWD/rpmbuild:$PWD/rpmbuild  --net=host $img_tag\
    rpmbuild --define "dist $dist" --define "_topdir $PWD/rpmbuild" -ba $PWD/rpmbuild/SPECS/flamegraph.spec
