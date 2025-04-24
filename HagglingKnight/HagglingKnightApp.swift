//
//  HagglingKnightApp.swift
//  HagglingKnight
//
//  Created by Tude Maha on 08/04/2025.
//

import SwiftUI

@main
struct HagglingKnightApp: App {
    
    init() {
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = .systemTeal
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
