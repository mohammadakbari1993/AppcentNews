//
//  Service.Model.Feed.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import Foundation

extension Service.Model {
    
    class Feeds : Codable {
        var status : String
        var totalResults : Int
        var articles : [Service.Model.Feeds.Feed]
        init(status: String, totalResults: Int, articles: [Service.Model.Feeds.Feed]) {
            self.status = status
            self.totalResults = totalResults
            self.articles = articles
        }
    }
    
}

extension Service.Model.Feeds {
    
    class Feed : Codable , Identifiable {
        var title : String
        var author : String
        var source : Service.Model.Feeds.Feed.Source
        var publishedAt : String
        var url : String
        init(title: String, author: String, source: Service.Model.Feeds.Feed.Source, publishedAt: String, url: String) {
            self.title = title
            self.author = author
            self.source = source
            self.publishedAt = publishedAt
            self.url = url
        }
    }
    
}


extension Service.Model.Feeds.Feed {
    
    class Source : Codable {
        var Id : String
        var Name : String
        init(Id: String, Name: String) {
            self.Id = Id
            self.Name = Name
        }
    }
    
}
