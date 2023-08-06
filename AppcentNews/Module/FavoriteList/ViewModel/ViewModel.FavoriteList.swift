//
//  ViewModel.FavoriteList.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/14/1402 AP.
//

import Foundation
import SwiftUI

extension ViewModels {
    
    class FavoriteList : Base.ViewModel<[Service.Model.Feeds.Feed]> {
        

        override func loadDataAutomatically() {
            self.fetchData()
        }
        
        func refresh() {
            fetchData()
        }
        
        private func fetchData() {
            DispatchQueue.main.async {
                self.items = RealmManager.shared.readFavoriteNews().compactMap({$0.newsObject})
            }
        }
        
    }
    
}
