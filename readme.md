
minetest_manager for docker
------------
state: WIP

# Overview

Manages:
* worldmod updates (if a submodule-repo is used)
* media generation
* logrotate

# Environment variables

* **WORLDMODS_DIR** path to worldmods repo
* **WORLDMODS_BRANCH** branch to use (optional)

* **MEDIADIR** directory for media assets (optional)

* **DEBUG_LOG** path to the debug log (optional)

# Usage

```bash
docker run \
 -v /data/minetest/world/worldmods:/mods \
 -v /var/html:/html \
 -v /tmp:/logs \
 -e WORLDMODS_DIR=/mods \
 -e WORLDMODS_BRANCH=master \
 -e MEDIADIR=/html \
 -e DEBUG_LOG=/logs/debug.log \
 buckaroobanzay/minetest_manager
```

# License

MIT
