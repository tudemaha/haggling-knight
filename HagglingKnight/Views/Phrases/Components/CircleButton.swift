import SwiftUI

struct CircleButton: View {
    @Binding var index: Int
    
    var label: String
    var icon: String
    
    var body: some View {
        Button(action: {
            if label == "Previous" {
                index = index - 1
            }
            
            if label == "Next"  {
                index = index + 1
            }
            print(index)
        }, label: {
            Label(label, systemImage: icon)
                .labelStyle(.iconOnly)
                .foregroundStyle(.white)
        })
        .padding(8)
        .background(.teal)
        .clipShape(.circle)
    }
}

#Preview {
    CircleButton(index: .constant(0), label: "Previous", icon: "chevron.left")
}
