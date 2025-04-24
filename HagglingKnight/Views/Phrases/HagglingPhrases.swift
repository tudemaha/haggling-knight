import SwiftUI

struct HagglingPhrases: View {
    
    @State private var isSheetShow = false
    
    var body: some View {
        ScrollView {
            Button {
                isSheetShow.toggle()
            } label: {
                PhrasesCard()
                    .padding(.vertical, 2)
            }
            .sheet(isPresented: $isSheetShow, content: {
                DetailModal()
                    .presentationDetents([.fraction(0.999)])
                    .presentationDragIndicator(.visible)
            })
            
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
        .toolbar() {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    print("refresh")
                }) {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
    }
}

#Preview {
    HagglingPhrases()
}
