import SwiftUI

struct DetailModal: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var isSaved = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Spacer()
                Spacer()
                
                Text("Bisa Kurang?")
                    .font(.title.bold())
                    .foregroundStyle(.teal)
                
                Text("Can it be cheaper?")
                    .font(.title3.bold())
                    .foregroundColor(.hkGray)
                
                Text("Used to ask the seller for a lower prices.")
                    .font(.subheadline)
                    .foregroundColor(.hkGray)
                
                VStack(spacing: 4) {
                    Text("Example:")
                    Text("Apakah harganya bisa kurang?")
                    Text("Can the price be lower?")
                }
                .font(.subheadline)
                .foregroundColor(.hkGray)
                
                Spacer()
                
                HStack(spacing: 30) {
                    SaveButton(isSaved: $isSaved)
                    
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
}

#Preview {
    DetailModal()
}
