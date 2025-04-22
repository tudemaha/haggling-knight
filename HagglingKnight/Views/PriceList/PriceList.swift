import SwiftUI

struct PriceList: View {
    var searchValue: String
    
    var body: some View {
        let layout = [
            GridItem(.adaptive(minimum: 100)),
            GridItem(.adaptive(minimum: 100)),
        ]
        
        VStack(alignment: .leading, spacing: 10) {
            if searchValue == "" {
                Text("Categories")
                    .font(.headline)
            }
            
            ScrollView {
                LazyVGrid(columns: layout) {
                    if searchValue != "" {
                        PriceCard(imageName: "carrot", name: "Carrot 1 Kg", price: "15.000")
                    } else {
                        NavigationLink {
                            CategorizedPrice(category: "Fruits")
                        } label: {
                            PriceCategoryCard(imageName: "lemon", category: "Fruits")
                        }
                        .buttonStyle(.plain)
                        
                        NavigationLink {
                            CategorizedPrice(category: "Vegetables")
                        } label: {
                            PriceCategoryCard(imageName: "carrot", category: "Vegetables")
                        }
                        .buttonStyle(.plain)

                        NavigationLink {
                            CategorizedPrice(category: "Spices")
                        } label: {
                            PriceCategoryCard(imageName: "onion", category: "Spices")
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .padding(.horizontal, 15)
        .padding(.top, 15)
        .background(.gray.opacity(0.1))
        
    }
}

#Preview {
    PriceList(searchValue: "carr")
}
