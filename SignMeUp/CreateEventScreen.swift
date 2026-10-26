import SwiftUI

struct CreateEventScreen: View {
    @Binding var tab: AppTab
    @EnvironmentObject private var store: EventsStore
    @State private var name = ""
    @State private var location = ""
    @State private var organizer = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 215)
                    .padding(.top, -28)
                    .padding(.bottom, -45)

                VStack(alignment: .leading, spacing: 0) {
                    Text("Event Details")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(Theme.navy)
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 12)
                    field("Event Name", prompt: "Enter Event Name", text: $name)
                    field("Location", prompt: "Enter Location", text: $location)
                    field("Organizer", prompt: "Enter Organizer", text: $organizer)

                    ForEach(["+ Add Address", "+ Add Time", "+ Add Note to All Participants"], id: \.self) { title in
                        Text(title)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(Theme.navy)
                            .frame(maxWidth: .infinity)
                            .padding(15)
                            .background(Theme.card, in: RoundedRectangle(cornerRadius: 15))
                            .cardShadow(cornerRadius: 15)
                            .padding(.bottom, 14)
                    }

                    Button { save(draft: false) } label: { saveLabel("Publish Event") }
                        .padding(.top, 6)
                        .padding(.bottom, 10)
                    Button { save(draft: true) } label: { saveLabel("Save as Draft") }
                        .opacity(0.8)
                }
                .padding(20)
                .background(Color(red: 0.94, green: 0.94, blue: 0.96).opacity(0.97), in: RoundedRectangle(cornerRadius: 15))
                .cardShadow(cornerRadius: 15)
            }
            .padding(25)
            .padding(.bottom, 15)
        }
        .scrollDismissesKeyboard(.interactively)
        .screenBackground("navy")
    }

    private func field(_ label: String, prompt: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Theme.navy)
            TextField("", text: text, prompt: Text(prompt).foregroundColor(Color(red: 0.54, green: 0.54, blue: 0.72)))
                .font(.system(size: 16))
                .foregroundStyle(.black)
                .padding(12)
                .background(.white, in: RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(red: 0, green: 0, blue: 0.5).opacity(0.3), lineWidth: 1))
        }
        .padding(.bottom, 15)
    }

    private func saveLabel(_ title: String) -> some View {
        Text(title)
            .font(.system(size: 16, weight: .bold))
            .foregroundStyle(Theme.navy)
            .frame(maxWidth: .infinity)
            .padding(15)
            .background(Theme.gold, in: RoundedRectangle(cornerRadius: 15))
    }

    private func save(draft: Bool) {
        let trimmed = name.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        store.add(
            name: trimmed,
            location: location.trimmingCharacters(in: .whitespaces),
            organizer: organizer.trimmingCharacters(in: .whitespaces),
            draft: draft
        )
        name = ""
        location = ""
        organizer = ""
        tab = .myEvents
    }
}
