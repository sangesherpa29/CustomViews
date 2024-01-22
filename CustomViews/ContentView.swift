//
//  ContentView.swift
//  CustomViews
//
//  Created by Web and App on 22/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: Tabs = .home
    var body: some View {
        VStack {
            switch selectedTab {
            case .home:
                HomeView()
            case .category:
                CategoryView()
            case .cart:
                CartView()
            case .profile:
                ProfileView()
            }
            
            CustomTabbar(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    ContentView()
}
