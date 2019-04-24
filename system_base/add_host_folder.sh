#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Script requires exactly two arguments" 1>&2
    echo "Usage: $0 HOST_FOLDER_NAME TARGET_DIRECTORY" 1>&2
    exit 1
fi

HOST_FOLDER_NAME=$1
TARGET_DIRECTORY=$2

echo "$HOST_FOLDER_NAME    $TARGET_DIRECTORY    vboxsf    defaults    0    0" >> /etc/fstab