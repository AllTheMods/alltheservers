#!/bin/bash
set -euo pipefail

# check for serverstarter jar
if [[ -f serverstarter-@@serverstarter-libVersion@@.jar ]]; then
    echo "Skipping download. Using existing serverstarter-@@serverstarter-libVersion@@.jar"
    java -jar serverstarter-@@serverstarter-libVersion@@.jar
    exit 0
else
    # download missing serverstarter jar
    URL="https://github.com/AllTheMods/alltheservers/releases/download/@@serverstarter-libVersion@@/serverstarter-@@serverstarter-libVersion@@.jar"

    if command -v wget &> /dev/null; then
        echo "DEBUG: (wget) Downloading ${URL}"
        wget -O serverstarter-@@serverstarter-libVersion@@.jar "${URL}"
    elif command -v curl &> /dev/null; then
        echo "DEBUG: (curl) Downloading ${URL}"
        curl -o serverstarter-@@serverstarter-libVersion@@.jar "${URL}"
    else
        echo "Neither wget or curl were found on your system. Please install one and try again"
        exit 1
    fi
fi

java -jar serverstarter-@@serverstarter-libVersion@@.jar