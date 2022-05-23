#!/bin/bash

pwd=$PWD
cd "$(dirname "$0")"

distros=(centos7-build euler-2003-build)
for distro in ${distros[@]}; do
    echo build for $distro
    rm -rf $pwd/$distro
    mkdir -p $pwd/$distro/RPMS
    for d in $(ls -d */); do
        echo -n $d "   "
        [ $d == "_docker" ] && continue
        pushd $d > /dev/null
        ./build.sh $distro
        popd > /dev/null
    done
    find */rpmbuild/RPMS/ -name "*.rpm" | xargs -I{} cp {} $pwd/$distro/RPMS 
    tree $pwd/$distro/RPMS
done


