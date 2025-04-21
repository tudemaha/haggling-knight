import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab: Int = 0
    @State private var isTabBarHidden = false
    @State private var searchValue: String = ""
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                ContentBase(title: "Haggling Knight", content: {
                    Phrases()
                })
            }
            .tabItem {
                Label("Phrases", systemImage: selectedTab == 0 ? "quote.bubble.fill" : "quote.bubble")
                    .environment(\.symbolVariants, .none)
            }
            .tag(0)
            
            NavigationStack {
                ContentBase(title: "Price List", content: {
                    PriceList()
                })
            }
            .searchable(text: $searchValue)
            .tabItem {
                Label("Price List", systemImage: selectedTab == 1 ? "list.bullet.clipboard.fill" : "list.bullet.clipboard")
                    .environment(\.symbolVariants, .none)
            }
            .tag(1)
            
            NavigationStack {
                Text("ini saved")
                    .navigationTitle("Saved")
            }
            .tabItem {
                Label("Saved", systemImage: selectedTab == 2 ? "bookmark.fill" : "bookmark")
                    .environment(\.symbolVariants, .none)
            }
            .tag(2)
        }
        .tint(.teal)
    }
}

struct ContentBase<Content: View>: View {
    let content: Content
    let title: String
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.title = title
    }
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
            
            content
        }
        .navigationTitle(title)
    }
}

#Preview {
    ContentView()
}
