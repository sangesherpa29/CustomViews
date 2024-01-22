//
//  CustomTabbar.swift
//  CustomViews
//
//  Created by Web and App on 22/01/2024.
//

import SwiftUI

enum Tabs {
    case home
    case category
    case cart
    case profile
}

struct CustomTabbar: View {
    @Binding var selectedTab: Tabs
    
    var body: some View {
        HStack(spacing: 60) {
            Button(action: {
                selectedTab = .home
            }, label: {
                TabItemView(image: "home", title: "Home")
                    .opacity(selectedTab == .home ? 1 : 0.3)
            })
            
            Button(action: {
                selectedTab = .category
            }, label: {
                TabItemView(image: "category", title: "Category")
                    .opacity(selectedTab == .category ? 1 : 0.3)
            })
            
            Button(action: {
                selectedTab = .cart
            }, label: {
                TabItemView(image: "shopping-bag", title: "Cart")
                    .opacity(selectedTab == .cart ? 1 : 0.3)
            })
            
            Button(action: {
                selectedTab = .profile
            }, label: {
                TabItemView(image: "smile", title: "Profile")
                    .opacity(selectedTab == .profile ? 1 : 0.3)
            })
            
        }
        .foregroundStyle(.black)
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(color: .gray.opacity(0.2), radius: 5)
    }
}


struct TabItemView: View {
    var image: String
    var title: String
    
    var body: some View {
        VStack(spacing: 5) {
            Image(image)
                .resizable()
                .frame(width: 22, height: 22)
            
            Text(title)
                .font(.caption)
                .fontWeight(.medium)
        }
    }
}

#Preview {
    CustomTabbar(selectedTab: .constant(.home))
}
