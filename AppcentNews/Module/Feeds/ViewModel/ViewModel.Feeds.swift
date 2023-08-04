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
        
        private let request = Service.Request.Feeds()
        
        override func loadDataAutomatically() {
            fetchFeed(keyWord: "All")
        }
        
        func fetchFeed(keyWord : String) {
            self.request.searchQuery = keyWord.isEmpty ? "All" : keyWord
            self.isNetworking = true
            networkService.request(request) { [weak self] result in
                switch result {
                case .success(let feeds):
                    guard let weak = self else {return}
                    DispatchQueue.main.async {
                        weak.items = feeds
                        weak.isNetworking = false
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
