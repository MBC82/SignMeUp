import SwiftUI

enum AppTab: CaseIterable {
    case home, myEvents, createEvent, profile

    var label: String {
        switch self {
        case .home: return "Home"
        case .myEvents: return "My Events"
        case .createEvent: return "Create Event"
        case .profile: return "My Profile"
        }
    }

    var icon: String {
        switch self {
        case .home: return "house.fill"
        case .myEvents: return "calendar"
        case .createEvent: return "calendar.badge.plus"
        case .profile: return "person.crop.circle.fill"
        }
    }
}

struct ContentView: View {
    @State private var tab: AppTab = .home

    var body: some View {
        Group {
            switch tab {
            case .home: HomeScreen()
            case .myEvents: MyEventsScreen(tab: $tab)
            case .createEvent: CreateEventScreen(tab: $tab)
            case .profile: ProfileScreen()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .safeAreaInset(edge: .top, spacing: 0) { TopNav() }
        .safeAreaInset(edge: .bottom, spacing: 0) { BottomBar(tab: $tab) }
    }
}

struct TopNav: View {
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            Button {} label: { Image(systemName: "bell.fill").font(.system(size: 22)) }
                .padding(10)
            Button {} label: { Image(systemName: "bubble.left.fill").font(.system(size: 22)) }
                .padding(10)
        }
        .foregroundStyle(Theme.navy)
        .padding(.horizontal, 12)
        .padding(.bottom, 4)
        .frame(maxWidth: .infinity)
        .background(Theme.gold.ignoresSafeArea(edges: .top))
    }
}

struct BottomBar: View {
    @Binding var tab: AppTab

    var body: some View {
        HStack {
            ForEach(AppTab.allCases, id: \.self) { item in
                Button { tab = item } label: {
                    VStack(spacing: 2) {
                        Image(systemName: item.icon)
                            .font(.system(size: 26))
                            .frame(height: 30)
                            .opacity(tab == item ? 1 : 0.7)
                        Text(item.label)
                            .font(.system(size: 12, weight: tab == item ? .bold : .regular))
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .foregroundStyle(Theme.navy)
        .padding(.top, 10)
        .padding(.bottom, 6)
        .background(Theme.gold.ignoresSafeArea(edges: .bottom))
    }
}
