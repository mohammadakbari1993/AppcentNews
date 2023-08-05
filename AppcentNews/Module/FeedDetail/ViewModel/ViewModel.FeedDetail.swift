//
//  ViewModel.FeedDetail.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/14/1402 AP.
//

import Foundation
import SwiftUI

extension ViewModels {
    
    class FeedDetail : Base.ViewModel<Service.Model.Feeds.Feed> {
        
        private let request = Service.Request.Feeds()
        @Published var showWebView : Bool = false
        init(feed : Service.Model.Feeds.Feed) {
            super.init()
            self.item = feed
        }
        
    }
    
}
