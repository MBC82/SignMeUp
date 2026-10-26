import SwiftUI

struct AppEvent: Identifiable {
    let id = UUID()
    var name: String
    var location: String
    var organizer: String
    var draft: Bool
}

/// In-memory events; there is no backend yet.
final class EventsStore: ObservableObject {
    @Published var events: [AppEvent] = []

    func add(name: String, location: String, organizer: String, draft: Bool) {
        events.insert(AppEvent(name: name, location: location, organizer: organizer, draft: draft), at: 0)
    }

    func remove(_ id: UUID) {
        events.removeAll { $0.id == id }
    }
}
