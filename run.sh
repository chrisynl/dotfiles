#!/bin/sh
source_dir="${PWD}/"
destination_dir="${HOME}/.config/"

for file in $(ls $1)
do
    if test -d $file
    then
	    echo "excuting ln -s ${source_dir}${file} ${destination_dir}${file}"
	    $(ln -s ${source_dir}${file} ${destination_dir}${file})
    fi
done
