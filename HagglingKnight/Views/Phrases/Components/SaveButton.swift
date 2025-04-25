import SwiftUI

struct SaveButton: View {
    @Binding var isSaved: Bool
    @State private var showAlert: Bool = false
    @State private var phrases: [Phrase] = []
    
    var phraseId: Int
    
    var body: some View {
        Button {
            if !isSaved {
                var filteredPhrases = phrases.filter { phrase in
                    phrase.id != phraseId
                }
                
                var currentPhrase = phrases.filter { phrase in
                    phrase.id == phraseId
                }
                
                currentPhrase[0].saved = true
                filteredPhrases.append(currentPhrase[0])
                print(filteredPhrases)
                save(filteredPhrases, to: "phrases.json")
                // simulation purpose
                isSaved.toggle()
            } else {
                showAlert = true
            }
            
            print("saved")
        } label: {
            Label("Save", systemImage: isSaved ? "bookmark.fill" : "bookmark")
                .labelStyle(.iconOnly)
                .font(.system(Font.TextStyle.title3, weight: .medium))
        }
        .foregroundColor(.teal)
        .alert("Remove Saved Phrase?", isPresented: $showAlert) {
            Button("Cancel", role: .cancel){}
                .foregroundStyle(.teal)
            Button("Delete", role: .destructive) {
                var filteredPhrases = phrases.filter { phrase in
                    phrase.id != phraseId
                }
                
                var currentPhrase = phrases.filter { phrase in
                    phrase.id == phraseId
                }
                
                currentPhrase[0].saved = false
                filteredPhrases.append(currentPhrase[0])
                print(filteredPhrases)
                save(filteredPhrases, to: "phrases.json")
                // simulation purpose
                isSaved.toggle()
            }
        }
        .onAppear {
            phrases = ModelData().phrases
        }
    }
    
    init(isSaved: Binding<Bool>, phraseId: Int) {
        self._isSaved = isSaved
        self.phraseId = phraseId
    }
}

#Preview {
    SaveButton(isSaved: .constant(false), phraseId: 1)
}
