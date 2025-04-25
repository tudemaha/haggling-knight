import SwiftUI

struct CategorizedPrice: View {
    var categoryName: String
    var categoryId: Int
    
    var filteredPrices: [Price] {
        ModelData().prices.filter { price in
            price.category_id == categoryId
        }
    }
    
    var body: some View {
        let layout = [
            GridItem(.adaptive(minimum: 100)),
            GridItem(.adaptive(minimum: 100)),
        ]
        
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(filteredPrices) { price in
                    PriceCard(imageName: price.image, name: price.name, price: price.price)
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle(categoryName)
        .padding(.horizontal, 15)
        .background(.gray.opacity(0.1))
    }
}

#Preview {
    CategorizedPrice(categoryName: "Fruits", categoryId: 1)
}
