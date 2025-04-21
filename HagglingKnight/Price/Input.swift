import SwiftUI

struct Input: View {
    @State private var price = 0
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                TextField(
                    "Harga",
                    value: $price,
                    format: .number
                )
                .padding(10)
                
                Button {
                    path.append("Result View")
                }label: {
                    Text("Calculate")
                }
                .navigationDestination(for: String.self) { view in
                    if view == "Result View" {
                        Price_Result(priceIdr: $price)
                    }
                }
            }
        }
        
        
    }
    
}

#Preview {
    Input()
}
