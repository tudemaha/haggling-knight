import SwiftUI

struct PriceCard: View {
    var imageName: String
    var name: String
    var price: String
    
    var body: some View {
        VStack(alignment: .leading) {
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
            
            Text(name)
                .font(.headline)
            
            Text("Rp" + price)
                .foregroundStyle(.secondary)
        }
        .padding(8)
        .background(.white)
        .clipShape(.rect(cornerRadius: 15))
        .shadow(color: .black.opacity(0.12), radius: 5, x: -4, y: 4)
    }
}

#Preview {
    PriceCard(imageName: "carrot", name: "Carrot 1 Kg", price: "15.000")
}
