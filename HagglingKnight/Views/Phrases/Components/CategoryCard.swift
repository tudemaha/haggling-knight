import SwiftUI

struct CateogryCard: View {
    var imageName: String
    var title: String

    var body: some View {
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
        .background(.teal)
        .clipShape(.rect(cornerRadius: 20))
        .shadow(radius: 5, x: -4, y: 4)
        
    }
}

#Preview {
    CateogryCard(imageName: "haggling-phrases", title: "Haggling Phrases")
}
