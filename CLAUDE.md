# SignMeUp

Native SwiftUI iPhone app (iOS 17+). No CocoaPods, no npm, no third-party dependencies. Bundle id `com.signmeup`, project `SignMeUp.xcodeproj`, scheme `SignMeUp`.
Sources live in `SignMeUp/` (a synchronized folder: any file added there is built automatically). Colors and shared modifiers in `Theme.swift`, artwork in `Assets.xcassets`. Design: gold top and bottom bars, navy icons and text. No backend yet; events are held in memory (`EventsStore.swift`).

## Build and run
Run `./run-ios.sh` (default device "iPhone 16 Pro", or pass another name). Or open `SignMeUp.xcodeproj` in Xcode and press Run.

Manual: `xcodebuild -project SignMeUp.xcodeproj -scheme SignMeUp -configuration Debug -destination "id=<simulator UDID>" -derivedDataPath build build`, then `xcrun simctl install <UDID> <path to SignMeUp.app>` and `xcrun simctl launch <UDID> com.signmeup`.

Simulator UDIDs: `xcrun simctl list devices available`. The app is iPhone only; never pick a watchOS destination.
