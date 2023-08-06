//
//  Localization.FavoriteList.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/14/1402 AP.
//

import Foundation

extension Localization {
    
    enum FavoriteList : Localizable {
        
        case page_title
        case empty_view_message
        
        var text: String {
            switch self {
            case .empty_view_message:
                return "There is no Favorite Item"
            case .page_title :
                return "Favorites"
            }
        }
  
        
    }
    
}
