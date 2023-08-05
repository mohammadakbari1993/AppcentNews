//
//  ViewModel.FeedDetail.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/14/1402 AP.
//

import Foundation
import SwiftUI

extension ViewModels {
    
    class FeedDetail : Base.ViewModel<Service.Model.Feeds.Feed> {
        
        private let request = Service.Request.Feeds()
        
        @Published var showWebView : Bool = false
        @Published var isFavorite : Bool = false
        
        init(feed : Service.Model.Feeds.Feed) {
            super.init()
            DispatchQueue.main.async {
                feed.isFavorite = RealmManager.shared.readFavoriteNews().filter({$0.title == feed.title && $0.publishedAt == feed.publishedAt}).count > 0
            }
            self.isFavorite = feed.isFavorite ?? false
            self.item = feed
        }
      
        func setFavorite(){
            DispatchQueue.main.async {
                guard let model = self.item?.realmObject else {return}
                if let item = RealmManager.shared.readFavoriteNews().filter({$0.title == (self.item?.title ?? "") && $0.publishedAt == (self.item?.publishedAt ?? "")}).last {
                    RealmManager.shared.deleteObjectFromRealm(item)
                } else {
                    RealmManager.shared.saveToRealm(model)
                }
                self.item?.isFavorite?.toggle()
            }
            isFavorite.toggle()
        }
        
        
    }
    
}
