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
        var urlToImage : String
        var description : String
        var content : String
        
        init(title: String, author: String, source: Service.Model.Feeds.Feed.Source, publishedAt: String, url: String, urlToImage: String, description: String, content: String) {
            self.title = title
            self.author = author
            self.source = source
            self.publishedAt = publishedAt
            self.url = url
            self.urlToImage = urlToImage
            self.description = description
            self.content = content
        }
        
        static let sample = Service.Model.Feeds.Feed(title: "Bundesliga: Test beendet: Augsburg trennt sich 1:1 von Besiktas",
                                                     author: "Mohammad Akbari",
                                                     source: .sample,
                                                     publishedAt: "2023-07-25T09:49:51Z",
                                                     url:"https://www.techradar.com/pro/this-nasty-stalkerware-was-found-spying-on-tens-of-thousands-of-phones",
                                                     urlToImage: "image",
                                                     description: "description",
                                                     content: "content")
        
        
        var displayedPublishAt : String {
            get {
                return publishedAt.dateConvert(to: .MONTHNAME_DAY)
            }
        }
        
        
        
        var realmObject : RealmManager.Model.News {
            get {
                let object = RealmManager.Model.News()
                object.title = self.title
                object.author = self.author
                object.source = self.source.realmObject
                object.publishedAt = self.publishedAt
                object.url = self.url
                return object
            }
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
        static let sample = Service.Model.Feeds.Feed.Source(Id: "google", Name: "Google news")
        
        var realmObject : RealmManager.Model.News.Source {
            get {
                let object = RealmManager.Model.News.Source()
                object.Id = self.Id
                object.Name = self.Name
                return object
            }
        }
    }
    
}
