import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab: Int = 0
    @State private var isTabBarHidden = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                ZStack {
                    Color.gray.opacity(0.1)
                    
                    Phrases()
                }
                .navigationTitle("Haggling Knight")
                
            }
            .tabItem {
                Label("Phrases", systemImage: selectedTab == 0 ? "quote.bubble.fill" : "quote.bubble")
                    .environment(\.symbolVariants, .none)
            }
            .tag(0)
            
            NavigationStack {
                Text("ini search")
                    .navigationTitle("Price List")
            }
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

#Preview {
    ContentView()
}
