import SwiftUI

struct PriceList: View {
    var searchValue: String
    
    var priceCategories = ModelData().priceCategories
    var prices = ModelData().prices
    
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
                        let searchResult = prices.filter {price in
                            price.name.contains(searchValue)
                        }
                        
                        ForEach(searchResult) {result in
                            PriceCard(imageName: result.image, name: result.name, price: result.price)
                        }
                    } else {
                        ForEach(priceCategories) {priceCategory in
                            NavigationLink {
                                CategorizedPrice(categoryName: priceCategory.category_name, categoryId: priceCategory.id)
                            } label: {
                                PriceCategoryCard(imageName: priceCategory.image, category: priceCategory.category_name)
                            }
                            .buttonStyle(.plain)
                        }
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
