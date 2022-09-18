#!/bin/bash

# Explicitly override VOXYGEN_LOGS because otherwise
# Veloren saves invalid log paths from previous snap revisions
# in its settings file.
export VOXYGEN_LOGS=$SNAP_USER_DATA/voxygen/logs

# Export the Vulkan ICD filename paths
# Based on the retroarch snap's Vulkan setup (https://github.com/libretro/retroarch-snap)
if [ "$SNAP_ARCH" = "amd64" ]; then
  export VK_ICD_FILENAMES="/var/lib/snapd/lib/vulkan/icd.d/nvidia_icd.json:$SNAP/usr/share/vulkan/icd.d/radeon_icd.x86_64.json:$SNAP/usr/share/vulkan/icd.d/intel_icd.x86_64.json"
elif [ "$SNAP_ARCH" = "i386" ]; then
  export VK_ICD_FILENAMES="/var/lib/snapd/lib/vulkan/icd.d/nvidia_icd.json:$SNAP/usr/share/vulkan/icd.d/radeon_icd.i686.json:$SNAP/usr/share/vulkan/icd.d/intel_icd.i686.json"
elif [ "$SNAP_ARCH" = "armhf" ]; then
  export VK_ICD_FILENAMES="/var/lib/snapd/lib/vulkan/icd.d/nvidia_icd.json:$SNAP/usr/share/vulkan/icd.d/radeon_icd.armv7l.json"
elif [ "$SNAP_ARCH" = "arm64" ]; then
  export VK_ICD_FILENAMES="/var/lib/snapd/lib/vulkan/icd.d/nvidia_icd.json:$SNAP/usr/share/vulkan/icd.d/radeon_icd.aarch64.json"
fi

exec "$@"
