import SwiftUI

struct Price_Result: View {
    @Binding var priceIdr: Int
    var body: some View {
        let fiftyPercent: Int = priceIdr * 50 / 100
        HStack {
            Text("50% price:")
            Text(String(format: "%d", fiftyPercent))
        }
        
        Divider()
        let inAud: Float = Float(fiftyPercent) / 10773
        HStack {
            Text("in AUD: ")
            Text(String(format: "%.1f", inAud))
        }
    }
}

#Preview {
    Price_Result(priceIdr: .constant(40000))
}
