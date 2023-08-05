//
//  RealmManager.Model.FavoriteNews.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/14/1402 AP.
//

import Foundation
import RealmSwift


class RealmNews : Object {
    @objc dynamic var localID = UUID().uuidString
    @objc dynamic var title : String = ""
    @objc dynamic var author : String = ""
    @objc dynamic var source : RealmSource? = RealmSource()
    @objc dynamic var publishedAt : String = ""
    @objc dynamic var url : String = ""
    @objc dynamic var urlToImage : String = ""
    @objc dynamic var _description : String = ""
    @objc dynamic var content : String = ""
    override class func primaryKey() -> String? {
        return "localID"
    }
    
}

class RealmSource : Object {
    @objc dynamic var localID = UUID().uuidString
    @objc dynamic var Id : String = ""
    @objc dynamic var Name : String = ""
    override class func primaryKey() -> String? {
        return "localID"
    }
}


extension RealmNews {
    
    var newsObject : Service.Model.Feeds.Feed {
        return .init(title: self.title, author: self.author, source: .init(Id: self.source?.Id ?? "", Name: self.source?.Name ?? ""), publishedAt: self.publishedAt, url: self.url, urlToImage: urlToImage,description: _description, content: content)
    }
    
}
