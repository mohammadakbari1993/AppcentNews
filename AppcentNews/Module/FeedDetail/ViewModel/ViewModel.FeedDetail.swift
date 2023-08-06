//
//  ViewModel.FeedDetail.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/14/1402 AP.
//

import Foundation
import SwiftUI
import FirebaseCore
import FirebaseAnalytics

extension ViewModels {
    
    class FeedDetail : Base.ViewModel<Service.Model.Feeds.Feed> {
        
 
        @Published var showWebView : Bool = false
        @Published var isFavorite : Bool = false
        
        init(feed : Service.Model.Feeds.Feed) {
            super.init()
            DispatchQueue.main.async {
                self.isFavorite = RealmManager.shared.readFavoriteNews().filter({$0.title == feed.title && $0.publishedAt == feed.publishedAt}).count > 0
            }
            self.item = feed
        }
      
        func setFavorite() {
            
            DispatchQueue.main.async {
                
                guard let model = self.item?.realmObject else {return}
            
                if let item = RealmManager.shared.readFavoriteNews().filter({$0.title == (self.item?.title ?? "") && $0.publishedAt == (self.item?.publishedAt ?? "")}).last {
                    
                    AnaliticsEvents.delted_from_favorite(news: item.newsObject).sendEvent()
                    RealmManager.shared.deleteObjectFromRealm(item)
                    
                } else {
                    
                    RealmManager.shared.saveToRealm(model)
                    AnaliticsEvents.added_to_favorite(news: model.newsObject).sendEvent()
                    
                }
                
                self.item?.isFavorite?.toggle()
                
            }
            
            isFavorite.toggle()
        }
        
        
    }
    
}
