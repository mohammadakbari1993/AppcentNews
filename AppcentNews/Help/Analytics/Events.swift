//
//  Events.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/14/1402 AP.
//

import Foundation
import FirebaseAnalytics

enum AnaliticsEvents {
    
    case added_to_favorite(news : Service.Model.Feeds.Feed)
    case delted_from_favorite(news : Service.Model.Feeds.Feed)
    case went_to_source(news : Service.Model.Feeds.Feed)
    
    var name : String {
        switch self {
        case .added_to_favorite:
            return "added_to_favorite"
        case .delted_from_favorite:
            return "delted_from_favorite"
        case .went_to_source:
            return "went_to_source"
        }
    }
    
    func sendEvent() {
        switch self {
        case .added_to_favorite(let news):
            Analytics.logEvent(self.name, parameters: ["source" : news.source.Id, "title" : news.title])
        case .delted_from_favorite(let news):
            Analytics.logEvent(self.name, parameters: ["source" : news.source.Id, "title" : news.title])
        case .went_to_source(let news):
            Analytics.logEvent(self.name, parameters: ["source" : news.source.Id])
        }
    }
    
}
