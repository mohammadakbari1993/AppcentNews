//
//  AppcentNewsApp.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import SwiftUI

@main
struct AppcentNewsApp: App {
    var body: some Scene {
        WindowGroup {
            
            
            TabView {
                NavigationView {
                    Views.Feeds()
                }
                .tabItem {
                    Label("Feed", systemImage: "newspaper.circle")
                }
                NavigationView {
                    Text("Mohammad")
                }
                .tabItem {
                    Label("Favorites", systemImage: "star.circle")
                }
            }
            
            
        }
    }
}
