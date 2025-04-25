import SwiftUI

struct Saved: View {
    
    var savedPhrases: [Phrase] {
        ModelData().phrases.filter {phrase in
            phrase.saved
        }
    }
    
    var body: some View {
        ScrollView {
            Spacer()
            ForEach(savedPhrases) { phrase in
                PhrasesCard(phrase)
            }
        }
    }
}

#Preview {
    Saved()
}
