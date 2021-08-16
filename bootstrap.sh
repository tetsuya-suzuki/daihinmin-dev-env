#!/usr/bin/env bash

apt update
apt upgrade

apt install -y xorg-dev

cd /home/vagrant/work

if [ ! -e tndhm_devkit_c-20180826.tar.gz ]; then
  wget http://www.tnlab.inf.uec.ac.jp/daihinmin/2021/files/tndhm_devkit_c-20180826.tar.gz
fi
if [ -e tndhm_devkit_c-20180826 ]; then
  rm -r tndhm_devkit_c-20180826
fi
tar zxvf tndhm_devkit_c-20180826.tar.gz

cd tndhm_devkit_c-20180826

pushd server/src
patch tndhms.cfg << EOT
3c3
< WINDOW_TYPE	new_normal
---
> #WINDOW_TYPE	new_normal
5c5
< #WINDOW_TYPE	console
---
> WINDOW_TYPE	console
11,12c11,12
< #GRAPH_WINDOW	none
< GRAPH_WINDOW	middle
---
> GRAPH_WINDOW	none
> #GRAPH_WINDOW	middle
EOT
popd

pushd server
./configure
make
popd

pushd client
./configure
make
popd


