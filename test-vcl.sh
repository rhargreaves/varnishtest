#!/bin/bash
VTC_FILE=$1
VCL_FILE=$2

cd /work
if [ ! -e $VTC_FILE ]; then
	echo "Usage: $(basename $0) <vtc_file> <vcl_file>"
	exit 1
fi

echo "Testing $VTC_FILE with $VCL_FILE"
COMBINED_FILE=/tmp/$(basename $VTC_FILE)
sed -e '/# VCL_PLACEHOLDER/ r '${VCL_FILE} -e 's/# VCL_PLACEHOLDER//' ${VTC_FILE} > ${COMBINED_FILE}
varnishtest ${COMBINED_FILE}
