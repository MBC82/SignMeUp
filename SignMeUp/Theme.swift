import SwiftUI

enum Theme {
    static let gold = Color(red: 1, green: 0.843, blue: 0)
    static let navy = Color(red: 0, green: 0, blue: 0.502)
    static let green = Color(red: 0.298, green: 0.686, blue: 0.314)
    static let red = Color.red
    static let blue = Color(red: 0, green: 0.478, blue: 1)
    static let card = Color(white: 0.992).opacity(0.95)
}

extension View {
    /// Card shadow plus hairline border, as used on panels and buttons.
    func cardShadow(cornerRadius: CGFloat) -> some View {
        self
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color(white: 0.86).opacity(0.8), lineWidth: 0.5)
            )
            .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
    }

    /// Full-screen artwork behind a screen. `stretch` fills the frame without keeping aspect ratio.
    func screenBackground(_ name: String, stretch: Bool = false) -> some View {
        background {
            Color.clear
                .overlay {
                    if stretch {
                        Image(name).resizable()
                    } else {
                        Image(name).resizable().scaledToFill()
                    }
                }
                .clipped()
                .ignoresSafeArea()
        }
    }
}
