import SwiftUI

struct PriceCategoryCard: View {
    var imageName: String
    var category: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .containerRelativeFrame(.vertical) {height, axis in
                    height * 0.25
                }
                .containerRelativeFrame(.horizontal) { width, axis in
                    width * 0.45
                }
                .clipShape(.rect(cornerRadius: 10))
            
            Text(category)
                .font(.headline)
        }
        .padding(8)
        .background(.white)
        .clipShape(.rect(cornerRadius: 15))
        .shadow(color: .black.opacity(0.12), radius: 5, x: -4, y: 4)
    }
}

#Preview {
    PriceCategoryCard(imageName: "lemon", category: "Fruits")
}
