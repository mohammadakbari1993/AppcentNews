//
//  Localization.Feeds.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import Foundation

extension Localization {
    
    enum Feeds: Localizable {
        
        case page_title
        case empty_view_message
        
        var text: String {
            switch self {
            case .empty_view_message:
                return "There is no result for your keyword"
            case .page_title :
                return "Appcent Feeds"
            }
        }
        
        
        enum Input: Localizable {
            
            case placeHolder
   
            var text: String {
                switch self {
                case .placeHolder:
                    return "Search the keyword ...."
                }
            }
            
        }
        
    }
    
}
