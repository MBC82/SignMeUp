import SwiftUI

struct MyEventsScreen: View {
    @Binding var tab: AppTab
    @EnvironmentObject private var store: EventsStore

    var body: some View {
        Group {
            if store.events.isEmpty {
                VStack(spacing: 24) {
                    Text("You have no events yet")
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                    Button { tab = .createEvent } label: {
                        Text("Create Event")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(Theme.navy)
                            .padding(.vertical, 14)
                            .padding(.horizontal, 40)
                            .background(Theme.gold, in: Capsule())
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(store.events) { event in
                            EventCard(event: event) { store.remove(event.id) }
                        }
                    }
                    .padding(16)
                }
            }
        }
        .screenBackground("blue")
    }
}

private struct EventCard: View {
    let event: AppEvent
    let onDelete: () -> Void

    var body: some View {
        VStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 2) {
                Text(event.name)
                    .font(.system(size: 18, weight: .bold))
                    .padding(.bottom, 4)
                Text("Location: \(event.location)").font(.system(size: 14))
                Text("Organizer: \(event.organizer)").font(.system(size: 14))
            }
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(Theme.gold.opacity(0.25), in: RoundedRectangle(cornerRadius: 8))

            HStack(spacing: 8) {
                actionLabel("eye.fill", fill: Theme.green, icon: .white)
                actionLabel("pencil", fill: Theme.gold, icon: Theme.navy)
                Button(action: onDelete) {
                    actionLabel("trash.fill", fill: Theme.red, icon: .white)
                }
            }
        }
        .padding(12)
        .background(.white, in: RoundedRectangle(cornerRadius: 12))
        .cardShadow(cornerRadius: 12)
        .overlay(alignment: .topTrailing) {
            Text(event.draft ? "DRAFT" : "LIVE")
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(event.draft ? Theme.navy : .white)
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
                .background(event.draft ? Theme.gold : Theme.red, in: RoundedRectangle(cornerRadius: 6))
                .padding(8)
        }
    }

    private func actionLabel(_ symbol: String, fill: Color, icon: Color) -> some View {
        Image(systemName: symbol)
            .font(.system(size: 20))
            .foregroundStyle(icon)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .background(fill, in: RoundedRectangle(cornerRadius: 8))
    }
}
