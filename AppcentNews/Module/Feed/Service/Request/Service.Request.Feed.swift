//
//  Service.Request.Feed.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import Foundation

extension Service.Request {
    
    class Feeds : DataRequest {
        
        var apiKeyStorage = Help.LocalStorage<String>.getStorage(key: AppKeys.api_key.rawValue)
 
        var page : Int = 1

        var searchQuery : String = "besiktas"
        
        var url: String {
            let baseURL: String = "https://newsapi.org/v2/"
            let path: String = "everything"
            return baseURL + path
        }
        
        var queryItems: [String : String] {
            [
                "q" : self.searchQuery.isEmpty ? "besiktas" : self.searchQuery,
                "page" : "\(page)",
                "apiKey": apiKeyStorage.value ?? ""
            ]
        }
        
        var method: Network.HTTPMethod {
            .get
        }
        
        func decode(_ data: Data) throws -> [Service.Model.Feeds.Feed] {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-mm-dd"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            let response = try decoder.decode(Service.Response.Feeds.self, from: data)
            let res = response.map()
            if !res.articles.isEmpty {
                self.page += 1
            }
            return res.articles
        }
        

    }
    
}

