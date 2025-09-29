#!/bin/bash

atag="v$(curl -s https://raw.githubusercontent.com/AerialiteLabs/Aurora/refs/heads/alpine/rootfs/usr/share/aurora/functions | grep 'VERSION\["NUMBER"]="' | cut -d'=' -f2 | tr -d '\"')"

curl -s https://api.github.com/repos/AerialiteLabs/Aurora/releases/tags/$atag -o src/data/aurora.json

curl -s https://api.github.com/repos/AerialiteLabs/sh1mmer/releases/tags/v1.0.0 -o src/data/nanoshims.json

curl -s https://api.github.com/repos/AerialiteLabs/sh1mmer/releases/tags/v2.0.0 -o src/data/sh1mmer.json

curl -s https://api.github.com/repos/AerialiteLabs/sh67mmer/releases/tags/v67 -o src/data/sh67mmer.json

curl -s https://api.github.com/repos/AerialiteLabs/shimboot/releases/tags/v1.0.0 -o src/data/shimboot.json

curl -s https://api.github.com/repos/AerialiteLabs/kvs/releases/tags/v2.0.0 -o src/data/kvs.json

curl -s https://api.github.com/repos/AerialiteLabs/picoshim/releases/tags/v1.0.0 -o src/data/picoshim.json