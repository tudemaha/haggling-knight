import SwiftUI

struct Phrases: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hi, John Doe! Ready to Haggle?")
                .font(.system(size: 22, weight: .medium))
                .padding(.top, 20)
            
            ZStack {
                CateogryCard(imageName: "haggling-phrases", title: "Haggling Phrases")
                
                HStack {
                    CircleButton(label: "Previous", icon: "chevron.left")
                    
                    Spacer()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.8
                        }
                    
                    CircleButton(label: "Next", icon: "chevron.right")
                }
                .padding(.horizontal, 5)
            }
            .padding(.bottom, 30)
        }
    }
}

#Preview {
    Phrases()
}
