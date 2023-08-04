//
//  ViewModel.Feeds.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import Foundation

extension ViewModels {
    
    class Feeds : Base.ViewModel<[Service.Model.Feeds.Feed]> {
        
        private let request = Service.Request.Feeds()
        
        func fetchMovie() {
               networkService.request(request) { [weak self] result in
                   switch result {
                   case .success(let feeds):
                       guard let weak = self else {return}
                       DispatchQueue.main.async {
                           weak.items = feeds
                       }
                       self?.onFetchSucceed?()
                   case .failure(let error):
                       print(error.localizedDescription)
                       self?.onFetchFailure?(error)
                   }
               }
           }
        
    }
    
}
