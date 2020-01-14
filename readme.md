
minetest_manager for docker
------------
state: WIP

# Overview

Manages:
* worldmod updates (if a submodule-repo is used)
* media generation

TODO:
* logrotate
* error log publish

# Usage

```bash
docker run \
 -v /data/minetest/world/worldmods:/mods \
 -v /var/html:/html \
 -e WORLDMODS_DIR=/mods \
 -e WORLDMODS_BRANCH=master \
 -e MEDIADIR=/html \
 buckaroobanzay/minetest_manager
```

# License

MIT
