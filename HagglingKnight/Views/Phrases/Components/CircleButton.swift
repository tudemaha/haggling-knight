import SwiftUI

struct CircleButton: View {
    var label: String
    var icon: String
    
    var body: some View {
        Button(action: {
            print("previous")
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
    CircleButton(label: "Previous", icon: "chevron.left")
}
