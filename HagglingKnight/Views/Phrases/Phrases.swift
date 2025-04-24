import SwiftUI

struct Phrases: View {
    @State private var index: Int = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("Hi, John Doe! Ready to Haggle?")
                .font(.system(size: 22, weight: .medium))
                .padding(.top, 20)
            
            ZStack {
                ScrollViewReader { proxy in
                    ScrollView(.horizontal) {
                        HStack(spacing: 60) {
                            ForEach(0..<5, id: \.self) {i in
                                CateogryCard(imageName: "haggling-phrases", title: "Haggling Phrases")
                                    .id(i)
                            }
                        }
                        .padding(.horizontal, 50)
                    }
                    .scrollIndicators(.hidden)
                    .onChange(of: index) { oldValue, newValue in
                        withAnimation {
                            proxy.scrollTo(newValue, anchor: .center)
                        }
                    }
                }
                
                HStack {
                    CircleButton(index: $index, label: "Previous", icon: "chevron.left")
                        .disabled(index == 0 ? true : false)
                    
                    Spacer()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.8
                        }
                    
                    CircleButton(index: $index, label: "Next", icon: "chevron.right")
                        .disabled(index == 4 ? true : false)
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


