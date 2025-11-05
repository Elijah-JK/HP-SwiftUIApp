//
//  ContentView.swift
//  HarryPotterSwiftUIApp
//
//  Created by Elijah K on 11/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Students", systemImage: "graduationcap.fill") {
                StudentView()
            }
            
            Tab("Staff", systemImage: "person.text.rectangle.fill") {
                StaffView()
            }
            
            Tab("Favorites", systemImage: "heart") {
                FavoritesView()
            }
            
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
            
            Tab(role: .search) {
                SearchView()
            }
        }
    }
}

#Preview {
    ContentView()
}
