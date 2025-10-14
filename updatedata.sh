#!/bin/bash

atag="v$(curl -s https://raw.githubusercontent.com/AerialiteLabs/Aurora/refs/heads/alpine/rootfs/usr/share/aurora/functions | grep 'VERSION\["NUMBER"]="' | cut -d'=' -f2 | tr -d '\"')"
batag="v2.0.0"

curl -s https://api.github.com/repos/AerialiteLabs/Aurora/releases/tags/$atag -o ./data/aurora.json

curl -s https://api.github.com/repos/AerialiteLabs/Aurora/releases/tags/$batag -o ./data/beta-aurora.json

curl -s https://api.github.com/repos/AerialiteLabs/sh1mmer/releases/tags/v1.0.0 -o ./data/nanoshims.json

curl -s https://api.github.com/repos/AerialiteLabs/sh1mmer/releases/tags/v2.0.0 -o ./data/sh1mmer.json

curl -s https://api.github.com/repos/AerialiteLabs/sh67mmer/releases/tags/v67 -o ./data/sh67mmer.json

curl -s https://api.github.com/repos/ading2210/shimboot/releases/tags/v1.3.0 -o ./data/shimboot.json
sed -i 's/"name": "v1\.3\.0",/"name": "Shimboot v1.3.0",/' ./data/shimboot.json

curl -s https://api.github.com/repos/AerialiteLabs/kvs/releases/tags/v2.0.0 -o ./data/kvs.json

curl -s https://api.github.com/repos/AerialiteLabs/picoshim/releases/tags/v1.0.0 -o ./data/picoshim.json