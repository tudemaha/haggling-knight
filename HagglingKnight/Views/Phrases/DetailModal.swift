import SwiftUI

struct DetailModal: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var isSaved: Bool
    var phrase: Phrase
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Spacer()
                Spacer()
                
                Text(phrase.phrase)
                    .font(.title.bold())
                    .foregroundStyle(.teal)
                
                Text(phrase.translate)
                    .font(.title3.bold())
                    .foregroundColor(.hkGray)
                
                Text(phrase.meaning)
                    .font(.subheadline)
                    .foregroundColor(.hkGray)
                
                VStack(spacing: 4) {
                    Text("Example:")
                    Text(phrase.example[0])
                    Text(phrase.example[1])
                }
                .font(.subheadline)
                .foregroundColor(.hkGray)
                
                Spacer()
                
                HStack(spacing: 30) {
                    SaveButton(isSaved: $isSaved, phraseId: phrase.id)
                    
                    VoiceButton()
                }
                
                Spacer()
                Spacer()
            }
            .navigationTitle("Detail")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Phrases")
                        }
                        .foregroundColor(.teal)
                    }
                }
            }
        }
    }
    init(_ phrase: Phrase) {
        self.phrase = phrase
        print(self.phrase.id)
        _isSaved = State(initialValue: phrase.saved)
    }
}

#Preview {
    DetailModal(ModelData().phrases[1])
}
