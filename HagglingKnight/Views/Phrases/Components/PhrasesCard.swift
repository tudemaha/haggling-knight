import SwiftUI

struct PhrasesCard: View {
    @State var isSaved: Bool
    var phrase: Phrase
    
    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 5) {
                Text(phrase.phrase)
                    .font(.title3.bold())
                
                Text(phrase.translate)
                    .font(.system(Font.TextStyle.callout, weight: .semibold))
                    .foregroundColor(.hkGray)
                
                
                Text(phrase.meaning)
                    .font(.caption)
                    .foregroundColor(.hkGray)
                    .multilineTextAlignment(.leading)
                
            }
            
            Spacer()
            
            HStack(spacing: 8) {
                SaveButton(isSaved: $isSaved)
                VoiceButton()
            }
        }
        .padding(20)
        .background(.white)
        .clipShape(.rect(cornerRadius: 12))
        .padding(.horizontal, 12)
        .shadow(color: .black.opacity(0.12), radius: 5, x: -4, y: 4)
    }
    
    init(_ phrase: Phrase) {
        self.phrase = phrase
        _isSaved = State(initialValue: phrase.saved)
    }
}

#Preview {
    PhrasesCard(ModelData().phrases[0])
}
