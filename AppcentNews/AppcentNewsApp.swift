//
//  AppcentNewsApp.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
   
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        var storage = Help.LocalStorage<String>.getStorage(key: AppKeys.api_key.rawValue)
        storage.value = AppKeys.api_key.value
        return true
        
    }
    
}

@main
struct AppcentNewsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
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
            }
                        
        }
        
    }
}
