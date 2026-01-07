#!/bin/bash

docker run --rm \
    --network=host \
    --privileged \
    --tmpfs /dev/shm:exec \
    -v /usr/local/bin/mediamtx.yml:/mediamtx.yml:z \
    -v /run/udev:/run/udev:ro \
    -e MTX_RTSPTRANSPORTS=tcp \
    -e MTX_WEBRTCADDITIONALHOSTS=192.168.0.195 \
    -p 8554:8554 \
    -p 1935:1935 \
    -p 8888:8888 \
    -p 8889:8889 \
    -p 8890:8890/udp \
    -p 8189:8189/udp \
    bluenviron/mediamtx:1-ffmpeg