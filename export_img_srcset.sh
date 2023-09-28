#!/bin/bash

# Command: ./export_img_srcset.sh -d employer_logo/ -h 24

while getopts h:d: flag
do
    case "${flag}" in
        h) smallH=${OPTARG};;
        d) imgDir=${OPTARG};;
    esac
done

if [ -z "$smallH" ] || [ -z "$imgDir" ]; then
        echo 'Missing -h or -d' >&2
        exit 1
fi

cd $imgDir
rm -rf formatted_old
mv formatted formatted_old
mkdir formatted
mkdir sizes
cd originals

# ImageMagic recommends switch to -colorspace RGB and back to -colorspace sRGB
# for better color shrinking. Also they recommend to check true colorSpace with ExifTool
mogrify -format webp -quality 80 -path ../sizes -geometry "x${smallH}" *
mv ../sizes/* ../formatted;

thearr=(1.5 2 3 4)
for i in "${thearr[@]}"; do
    imgH=`awk "BEGIN {print $i*$smallH}"`
    echo $imgH
    mogrify -format webp -quality 80 -path ../sizes -geometry "x${imgH}" *
    for file in ../sizes/*; do
        mv "$file" "${file%.webp}@${i}x.webp"; 
    done;
    mv ../sizes/* ../formatted;
done

cd ..
rmdir sizes
cd ..
