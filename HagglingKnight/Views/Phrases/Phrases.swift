import SwiftUI

struct Phrases: View {
    @State private var index: Int = 1
    
    var phraseCategories: [PhraseCategory] = ModelData().phraseCategories
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Hi, John Doe! Ready to Haggle?")
                .font(.system(size: 22, weight: .medium))
                .padding(.top, 20)
            
            ZStack {
                ScrollViewReader { proxy in
                    ScrollView(.horizontal) {
                        HStack(spacing: 60) {
                            ForEach(phraseCategories) {phraseCategory in
                                CateogryCard(phraseCategory)
                                    .id(phraseCategory.id)
                            }
                        }
                        .padding(.horizontal, 50)
                    }
                    .scrollIndicators(.hidden)
                    .onChange(of: index) { _, newValue in
                        withAnimation {
                            proxy.scrollTo(newValue, anchor: .center)
                        }
                    }
                }
                
                HStack {
                    CircleButton(index: $index, label: "Previous", icon: "chevron.left")
                        .disabled(index <= 1 ? true : false)
                    
                    Spacer()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.8
                        }
                    
                    CircleButton(index: $index, label: "Next", icon: "chevron.right")
                        .disabled(index >= phraseCategories.count ? true : false)
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


