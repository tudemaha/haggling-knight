import SwiftUI

struct CateogryCard: View {
    
    var imageName: String
    var title: String
    
    var body: some View {
        NavigationLink(value: "phrases", label: {
            VStack(spacing: 15) {
                
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.74
                    }
                    .padding(.top, 20)
                
                Text(title)
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .padding(.bottom, 20)
            }
            .navigationDestination(for: String.self) { value in
                if value == "phrases" {
                    HagglingPhrases()
                }
            }
            .background(.teal)
            .clipShape(.rect(cornerRadius: 20))
            .shadow(color: .black.opacity(0.12), radius: 5, x: -4, y: 4)
        })
    }
}

#Preview {
    CateogryCard(imageName: "haggling-phrases", title: "Haggling Phrases")
}
