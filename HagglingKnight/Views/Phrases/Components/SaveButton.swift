import SwiftUI

struct SaveButton: View {
    @Binding var isSaved: Bool
    
    var body: some View {
        Button {
            isSaved.toggle()
            print("saved")
        } label: {
            Label("Save", systemImage: isSaved ? "bookmark.fill" : "bookmark")
                .labelStyle(.iconOnly)
                .font(.system(Font.TextStyle.title3, weight: .medium))
        }
        .foregroundColor(.teal)
    }
}

#Preview {
    SaveButton(isSaved: .constant(false))
}
