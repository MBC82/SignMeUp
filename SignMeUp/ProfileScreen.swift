import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        VStack(spacing: 14) {
            Text("Welcome to Sign Me Up")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.black)
                .multilineTextAlignment(.center)
                .padding(.bottom, 6)
            ForEach(["Create Account", "Login"], id: \.self) { title in
                Button {} label: {
                    Text(title)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Theme.blue, in: RoundedRectangle(cornerRadius: 6))
                }
                .padding(.horizontal, 30)
            }
        }
        .padding(22)
        .frame(maxWidth: .infinity)
        .background(Theme.gold, in: RoundedRectangle(cornerRadius: 14))
        .padding(.horizontal, 36)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .screenBackground("home", stretch: true)
    }
}
