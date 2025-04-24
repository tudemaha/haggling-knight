import SwiftUI

struct SaveButton: View {
    @Binding var isSaved: Bool
    @State private var showAlert: Bool = false
    
    var body: some View {
        Button {
            isSaved.toggle()
            showAlert = !isSaved
            print("saved")
        } label: {
            Label("Save", systemImage: isSaved ? "bookmark.fill" : "bookmark")
                .labelStyle(.iconOnly)
                .font(.system(Font.TextStyle.title3, weight: .medium))
        }
        .foregroundColor(.teal)
        .alert("Remove Saved Phrase?", isPresented: $showAlert) {
            Button("Cancel", role: .cancel){}
                .foregroundStyle(.teal)
            Button("Delete", role: .destructive) {}
        }
    }
}

#Preview {
    SaveButton(isSaved: .constant(false))
}
