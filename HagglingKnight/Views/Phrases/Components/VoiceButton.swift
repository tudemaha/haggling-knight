import SwiftUI

struct VoiceButton: View {
    var body: some View {
        Button {
            print("voice")
        } label: {
            Label("Play Voice", systemImage: "speaker.wave.2")
                .labelStyle(.iconOnly)
                .font(.system(Font.TextStyle.title3, weight: .medium))
        }
        .foregroundColor(.teal)
    }
}

#Preview {
    VoiceButton()
}
