#!/bin/bash
# When pre-split makes chunks that are still to big
mkdir dataset
mkdir dataset/44k
mkdir dataset/44k/$(basename $(pwd))
sizethreshold=14680064
for fullfile in ./dataset_raw/*.wav; do
    filesize=$(wc -c <"$fullfile")
    filename=$(basename -- "$fullfile")
    echo $filename
    if [ $filesize -ge $sizethreshold ]; then
        ffmpeg -i "./dataset_raw/$filename" -f segment -segment_time 30 -c copy "./dataset/44k/$(basename $(pwd))/$filename.%03d.wav"
    else
        mv "./dataset_raw/$filename" "./dataset/44k/$(basename $(pwd))/"
    fi
    
done