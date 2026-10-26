#!/bin/bash
# Builds SignMeUp and launches it in an iPhone simulator. Usage: ./run-ios.sh ["iPhone 16 Pro"]
set -e
cd "$(dirname "$0")"
DEVICE="${1:-iPhone 16 Pro}"

echo "==> Finding simulator: $DEVICE"
UDID=$(xcrun simctl list devices available | grep -F "$DEVICE (" | head -1 | grep -oE '[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}')
if [ -z "$UDID" ]; then
  echo "No simulator named '$DEVICE'. Available:"; xcrun simctl list devices available | grep -i iphone; exit 1
fi
echo "    $UDID"

xcrun simctl boot "$UDID" 2>/dev/null || true
open -a Simulator --args -CurrentDeviceUDID "$UDID" || true

echo "==> Building"
xcodebuild -project SignMeUp.xcodeproj -scheme SignMeUp -configuration Debug \
  -destination "id=$UDID" -derivedDataPath build build | tail -25

APP=$(find build/Build/Products -name "SignMeUp.app" -maxdepth 3 | head -1)
xcrun simctl install "$UDID" "$APP"
xcrun simctl launch "$UDID" com.signmeup
echo "==> Launched com.signmeup"
