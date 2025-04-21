import SwiftUI

struct PriceList: View {
    var body: some View {
        let layout = [
            GridItem(.adaptive(minimum: 100)),
            GridItem(.adaptive(minimum: 100)),
        ]
        
        VStack(alignment: .leading, spacing: 10) {
            Text("Categories")
                .font(.headline)
            
            ScrollView {
                LazyVGrid(columns: layout) {
                    NavigationLink {
                        CategorizedPrice()
                    } label: {
                        PriceCategoryCard(imageName: "lemon", category: "Fruits")
                    }
                    .buttonStyle(.plain)
                    
                    NavigationLink {
                        CategorizedPrice()
                    } label: {
                        PriceCategoryCard(imageName: "carrot", category: "Vegetables")
                    }
                    .buttonStyle(.plain)

                    NavigationLink {
                        CategorizedPrice()
                    } label: {
                        PriceCategoryCard(imageName: "onion", category: "Spices")
                    }
                    .buttonStyle(.plain)

                }
            }
        }
        .padding(.horizontal, 15)
        .padding(.top, 15)
        .background(.gray.opacity(0.1))
        
    }
}

#Preview {
    PriceList()
}
