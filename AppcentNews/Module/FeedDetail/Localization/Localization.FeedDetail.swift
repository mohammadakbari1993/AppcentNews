//
//  Localization.FeedDetail.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/14/1402 AP.
//

import Foundation

extension Localization {
    
    enum FeedDetail : Localizable {
        
        case page_title
        case empty_view_message
        
        var text: String {
            switch self {
            case .empty_view_message:
                return "There is no detail"
            case .page_title :
                return "News Detail"
            }
        }
        
        
        enum Button : Localizable {
            
            case news_source
   
            var text: String {
                switch self {
                case .news_source:
                    return "News Source"
                }
            }
            
        }
        
    }
    
}
