#!/bin/sh

#  scrcpyMirror.sh
#  AndroidTool
#
# DESC: run scrcpy to mirror device screen
#

dir=$(dirname "$0")
source $dir/androidtool_prefix.sh
thisdir=$1 # $1 is the bundle resources path directly from the calling script file
serial=$2
screenshotFolder=$3
activityName=$4

echo "running scrcpy with $serial"
echo "ADB: $ANDROID_SDK_ROOT/platform-tools"
export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH

# scrcpy installed via homebrew can end up in different locations
SCRCPY=/usr/local/bin/scrcpy
if [ ! -f "$SCRCPY" ]; then
  SCRCPY=/opt/homebrew/bin/scrcpy
fi

# options:
# --stay-awake
# --always-on-top
# --encoder ['OMX.qcom.video.encoder.avc', 'c2.android.avc.encoder', 'OMX.google.h264.encoder']
$SCRCPY -s $serial --show-touches --stay-awake --encoder 'c2.android.avc.encoder'
