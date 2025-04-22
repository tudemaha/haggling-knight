import SwiftUI

struct Saved: View {
    var body: some View {
        ScrollView {
            Spacer()
            PhrasesCard()
            PhrasesCard()
            PhrasesCard()
        }
    }
}

#Preview {
    Saved()
}
