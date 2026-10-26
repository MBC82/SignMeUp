import SwiftUI

@main
struct SignMeUpApp: App {
    @StateObject private var events = EventsStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(events)
        }
    }
}
