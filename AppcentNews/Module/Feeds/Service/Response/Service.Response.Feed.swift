//
//  Service.Response.Feed.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import Foundation

extension Service.Response {
    
    class Feeds : Codable, Mappable {
        var status : String
        var totalResults : Int
        var articles : [Service.Response.Feeds.Feed]
        typealias T = Service.Model.Feeds
        
        func map() -> T {
            return T(status: status, totalResults: totalResults, articles: articles.map({$0.map()}))
        }
    }
    
}

extension Service.Response.Feeds {
    
    class Feed : Codable, Mappable {
        var title : String
        var author : String?
        var source : Service.Response.Feeds.Feed.Source
        var publishedAt : String
        var url : String?
        typealias T = Service.Model.Feeds.Feed
        
        func map() -> T {
            return T(title: title, author: author ?? "", source: source.map(), publishedAt: publishedAt, url: url ?? "")
        }
    }
    
}


extension Service.Response.Feeds.Feed {
    
    class Source : Codable, Mappable {
        var Id : String?
        var Name : String?
        typealias T = Service.Model.Feeds.Feed.Source
        
        func map() -> T {
            return T(Id: Id ?? "", Name: Name ?? "")
        }
    }
    
}
