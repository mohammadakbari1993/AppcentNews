//
//  Base.ViewModel.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import Foundation
import SwiftUI

extension Base {
    
    
    class ViewModel<T:Decodable> : ObservableObject {
        
        @Published var items : T?
        @Published var item : T?
        @Published var filteredItems : T?
        @Published var filterModeIsActive : Bool = false
        
        //Alert Variables
        var alertTitle : String?
        var alertDescription : String?
        @Published var showAlert : Bool = false
        
        init() {
            loadDataAutomatically()
        }
        
        open func loadDataAutomatically() {
            // You need to override if you want automatic requests
        }
        
        open func getAlert() -> Alert {
            return Alert(title: Text(alertTitle ?? ""), message: Text(alertDescription ?? ""))
        }
        
    }
    
    
}
