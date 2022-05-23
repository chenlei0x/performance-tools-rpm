ARG arch
FROM harbor.smartx.com/kernel/centos-$arch:7

RUN yum --disableplugin=fastestmirror makecache && yum install -y epel-release && yum install -y cmake3 gcc-c++ rpm-build make \
    libaio-devel libtool mariadb-devel postgresql-devel python2

RUN yum install -y bison flex libxml2-devel ncurses-devel
RUN yum install -y help2man perl-generators perl php-cli
RUN yum install -y libpcap-devel
