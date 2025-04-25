import SwiftUI

struct HagglingPhrases: View {
    
    @State private var selectedPhrase: Phrase? = nil
    @State private var filteredPhrases: [Phrase] = []

    var phraseCategoryID: Int
    
    var body: some View {
        ScrollView {
            ForEach(filteredPhrases) { phrase in
                Button {
                    selectedPhrase = phrase
                } label: {
                    PhrasesCard(phrase)
                        .padding(.vertical, 2)
                }
            }
        }
        .onAppear {
            filteredPhrases = ModelData().phrases
                .filter { $0.category_id == phraseCategoryID }
        }
        .sheet(item: $selectedPhrase) { phrase in
            DetailModal(phrase)
                .presentationDetents([.fraction(0.999)])
                .presentationDragIndicator(.visible)
        }
        .navigationTitle("Haggling Phrases")
        .background(.gray.opacity(0.1))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar() {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    filteredPhrases = filteredPhrases.shuffled()
                }) {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
    }
    init(_ phraseCategoryID: Int) {
        self.phraseCategoryID = phraseCategoryID
    }
}

#Preview {
    HagglingPhrases(1)
}
