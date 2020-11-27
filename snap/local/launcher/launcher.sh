#!/bin/bash

export VELOREN_USERDATA=$SNAP_USER_DATA
# Explicitly override VOXYGEN_LOGS because otherwise
# Veloren saves invalid log paths from previous snap revisions
# in its settings file.
export VOXYGEN_LOGS=$SNAP_USER_DATA/voxygen/logs

exec "$@"
