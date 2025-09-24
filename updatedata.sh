#!/bin/bash

atag="v$(curl -s https://raw.githubusercontent.com/AerialiteLabs/Aurora/refs/heads/alpine/rootfs/usr/share/aurora/functions | grep 'VERSION\["NUMBER"]="' | cut -d'=' -f2 | tr -d '\"')"

curl -s https://api.github.com/repos/AerialiteLabs/Aurora/releases/tags/$atag -o src/data/aurora.json
perl -0777 -pe 's/\{\s*"url"\s*:/\{\n  "lowercasename": "aurora",\n  "url":/s' -i src/data/aurora.json

curl -s https://api.github.com/repos/AerialiteLabs/sh1mmer/releases/tags/v1.0.0 -o src/data/nanoshims.json
perl -0777 -pe 's/\{\s*"url"\s*:/\{\n  "lowercasename": "nanoshims",\n  "url":/s' -i src/data/nanoshims.json

curl -s https://api.github.com/repos/AerialiteLabs/sh1mmer/releases/tags/v2.0.0 -o src/data/sh1mmer.json
perl -0777 -pe 's/\{\s*"url"\s*:/\{\n  "lowercasename": "sh1mmer",\n  "url":/s' -i src/data/sh1mmer.json

curl -s https://api.github.com/repos/AerialiteLabs/sh67mmer/releases/tags/v67 -o src/data/sh67mmer.json
perl -0777 -pe 's/\{\s*"url"\s*:/\{\n  "lowercasename": "sh67mmer",\n  "url":/s' -i src/data/sh67mmer.json

curl -s https://api.github.com/repos/AerialiteLabs/shimboot/releases/tags/v1.0.0 -o src/data/shimboot.json
perl -0777 -pe 's/\{\s*"url"\s*:/\{\n  "lowercasename": "shimboot",\n  "url":/s' -i src/data/shimboot.json
