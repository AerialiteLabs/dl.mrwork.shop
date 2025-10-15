#!/bin/bash

atag="shrimp"
batag="v2.0.0"

[ "$1" != "skipaurora" ] && curl -s https://api.github.com/repos/AerialiteLabs/Aurora/releases/tags/$atag -o ./data/aurora.json
[ "$1" = "skipaurora" ] && shift
[ "$1" != "skipbeta" ] && curl -s https://api.github.com/repos/AerialiteLabs/Aurora/releases/tags/$batag -o ./data/beta-aurora.json
[ "$1" = "skipbeta" ] && shift
[ "$1" != "skipnanoshims" ] && curl -s https://api.github.com/repos/AerialiteLabs/sh1mmer/releases/tags/v1.0.0 -o ./data/nanoshims.json
[ "$1" = "skipnanoshims" ] && shift
[ "$1" != "skipsh1mmer" ] && curl -s https://api.github.com/repos/AerialiteLabs/sh1mmer/releases/tags/v2.0.0 -o ./data/sh1mmer.json
[ "$1" = "skipsh1mmer" ] && shift
[ "$1" != "skipsh67mmer" ] && curl -s https://api.github.com/repos/AerialiteLabs/sh67mmer/releases/tags/v67 -o ./data/sh67mmer.json
[ "$1" = "skipsh67mmer" ] && shift
[ "$1" != "skipkvs" ] && curl -s https://api.github.com/repos/AerialiteLabs/kvs/releases/tags/v2.0.0 -o ./data/kvs.json
[ "$1" = "skipkvs" ] && shift
[ "$1" != "skippicoshim" ] && curl -s https://api.github.com/repos/AerialiteLabs/picoshim/releases/tags/v1.0.0 -o ./data/picoshim.json