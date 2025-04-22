import SwiftUI

struct CategorizedPrice: View {
    var category: String
    
    var body: some View {
        let layout = [
            GridItem(.adaptive(minimum: 100)),
            GridItem(.adaptive(minimum: 100)),
        ]
        
        ScrollView {
            LazyVGrid(columns: layout) {
                PriceCard(imageName: "carrot", name: "Carrot 1 Kg", price: "15.000")
                PriceCard(imageName: "carrot", name: "Carrot 1 Kg", price: "15.000")
                PriceCard(imageName: "carrot", name: "Carrot 1 Kg", price: "15.000")
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle(category)
        .padding(.horizontal, 15)
        .background(.gray.opacity(0.1))
    }
}

#Preview {
    CategorizedPrice(category: "Fruits")
}
