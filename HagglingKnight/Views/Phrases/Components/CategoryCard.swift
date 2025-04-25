import SwiftUI

struct CateogryCard: View {
    
    var categoryDetail: PhraseCategory
    
    var body: some View {
        NavigationLink(value: "phrases", label: {
            VStack(spacing: 15) {
                
                Image(categoryDetail.image)
                    .resizable()
                    .scaledToFill()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.74
                    }
                    .padding(.top, 20)
                
                Text(categoryDetail.title)
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .padding(.bottom, 20)
            }
            .navigationDestination(for: String.self) { value in
                if value == "phrases" {
                    HagglingPhrases(categoryDetail.id)
                }
            }
            .background(categoryDetail.active ? .teal : .gray)
            .clipShape(.rect(cornerRadius: 20))
            .shadow(color: .black.opacity(0.12), radius: 5, x: -4, y: 4)
        })
        .disabled(categoryDetail.active ? false : true)
    }
    
    init(_ categoryDetail: PhraseCategory) {
        self.categoryDetail = categoryDetail
    }
}

#Preview {
    CateogryCard(ModelData().phraseCategories[0])
}
