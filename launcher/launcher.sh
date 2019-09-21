#!/bin/bash

# Veloren currently saves settings in the CWD.
# Therefore we change the working directory to the snap user data folder
cd $SNAP_USER_DATA
if [ -z "$DESKTOP_LAUNCH" ]
then
    exec "$@"
else
    desktop-launch "$@"
fi
