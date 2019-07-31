#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Script requires exactly two arguments" 1>&2
    echo "Usage: $0 HOST_FOLDER_NAME TARGET_DIRECTORY" 1>&2
    exit 1
fi

HOST_FOLDER_NAME=$1
TARGET_DIRECTORY=$2

mkdir -p $TARGET_DIRECTORY
if [ $? -ne 0 ]; then
    echo "Error while creating directory '$TARGET_DIRECTORY'." 1&>2
    exit 1
fi

echo "$HOST_FOLDER_NAME    $TARGET_DIRECTORY    vboxsf    defaults,umask=022,uid=1002,gid=1002    0    0" >> /etc/fstab
if [ $? -ne 0 ]; then
    echo "Error while adding '$HOST_FOLDER_NAME' host folder to '/etc/fstab'." 1&>2
    exit 1
fi