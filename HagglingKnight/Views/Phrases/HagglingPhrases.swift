import SwiftUI

struct HagglingPhrases: View {    
    var body: some View {
        ScrollView {
            PhrasesCard()
                .padding(.vertical, 2)
            PhrasesCard()
                .padding(.vertical, 2)
            PhrasesCard()
                .padding(.vertical, 2)
            PhrasesCard()
                .padding(.vertical, 2)
            PhrasesCard()
                .padding(.vertical, 2)
            PhrasesCard()
                .padding(.vertical, 2)
            PhrasesCard()
                .padding(.vertical, 2)
        }
        .navigationTitle("Haggling Phrases")
        .background(.gray.opacity(0.1))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    HagglingPhrases()
}
