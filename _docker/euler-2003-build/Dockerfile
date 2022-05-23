ARG arch
FROM harbor.smartx.com/kernel/openeuler-$arch:20.03-lts-sp3

RUN yum --disableplugin=fastestmirror makecache && yum install -y cmake3 gcc-c++ rpm-build make \
    libaio-devel libtool mariadb-devel postgresql-devel python2

RUN yum install -y bison flex libxml2-devel ncurses-devel
RUN yum install -y hostname
RUN yum install -y help2man perl-generators perl php-cli
