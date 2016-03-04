#!/bin/bash
cd /opt/varnish
make clean
make 
make install
varnishd $*
