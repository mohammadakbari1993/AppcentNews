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
                    Views.FavoriteList()
                }
                .tabItem {
                    Label("Favorites", systemImage: "star.circle")
                }
            }.onAppear {
                var storage = Help.LocalStorage<String>.getStorage(key: AppKeys.api_key.rawValue)
                storage.value = AppKeys.api_key.value
            }
                        
        }
        
    }
}
