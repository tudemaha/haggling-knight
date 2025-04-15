import SwiftUI

struct PhrasesCard: View {
    @State var isSaved: Bool = false
    
    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Bisa kurang?")
                    .font(.title3.bold())
                
                Text("Can it be cheaper?")
                    .font(.system(Font.TextStyle.callout, weight: .semibold))
                    .foregroundColor(.hkGray)
                
                
                Text("Used to ask the seller for a lower prices.")
                    .font(.caption)
                    .foregroundColor(.hkGray)
                
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
}

#Preview {
    PhrasesCard()
}
