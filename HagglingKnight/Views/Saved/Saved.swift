import SwiftUI

struct Saved: View {
    var body: some View {
        ScrollView {
            Spacer()
            PhrasesCard(ModelData().phrases[0])

        }
    }
}

#Preview {
    Saved()
}
