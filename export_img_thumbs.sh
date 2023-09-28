#!/bin/bash

while getopts h:d: flag
do
    case "${flag}" in
        h) thumbH=${OPTARG};;
        d) imgDir=${OPTARG};;
    esac
done

if [ -z "$thumbH" ] || [ -z "$imgDir" ]; then
        echo 'Missing -h or -d' >&2
        exit 1
fi

cd $imgDir
rm -rf thumbs_old
rm -rf webp_old
mv thumbs thumbs_old
mv webp webp_old
mkdir thumbs
mkdir webp
cd originals/
mogrify -format webp -quality 50 -path ../webp *
mogrify -format webp -quality 80 -path ../thumbs -geometry "x${thumbH}" *
cd ../..
