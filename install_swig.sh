#!/bin/sh
CPUCOUNT=$(grep -c   "^processor" /proc/cpuinfo)

wget -O swig.tar.gz https://sourceforge.net/projects/swig/files/swig/swig-3.0.12/swig-3.0.12.tar.gz
tar -zxvf swig.tar.gz 
cd swig-3.0.12 
./configure
make -j${CPUCOUNT}
make -j${CPUCOUNT} install
rm -rf swig.tar.gz
rm -rf swig-3.0.12
