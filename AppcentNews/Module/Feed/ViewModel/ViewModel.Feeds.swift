//
//  ViewModel.Feeds.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import Foundation
import SwiftUI

extension ViewModels {
    
    class Feeds : Base.ViewModel<[Service.Model.Feeds.Feed]> {
        
        var request = Service.Request.Feeds()
        
        private var needToFetchMore : Bool = false
        
        override func loadDataAutomatically() {
            fetchFeed()
        }
        
        func fetchMore(model : Service.Model.Feeds.Feed) {
            if needToFetchMore && model == (self.items?.last ?? .sample) && !isNetworking {
                fetchFeed()
            }
        }
        
        func refresh() {
            request.page = 1
            needToFetchMore = true
            self.items?.removeAll()
            fetchFeed()
        }
        
        func fetchFeed() {
            self.isNetworking = true
            networkService.request(request) { [weak self] result in
                switch result {
                case .success(let feeds):
                    guard let weak = self else {return}
                    DispatchQueue.main.async {
                        weak.items = (weak.items == nil) ? feeds : weak.items! + feeds
                        weak.isNetworking = false
                        weak.needToFetchMore = !feeds.isEmpty
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.alertTitle = "Server Error"
                        self?.alertDescription = error.localizedDescription
                        self?.showAlert = true
                        self?.isNetworking = false
                    }
                }
            }
        }
        
    }
    
}
