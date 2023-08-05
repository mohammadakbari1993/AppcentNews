//
//  Help.LocalStorage.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import Foundation

extension Help {
    
    struct LocalStorage<T> {
        
        let key: String
        
        var value: T? {
            get {
                UserDefaults.standard.value(forKey: key) as? T
            }
            
            set {
                UserDefaults.standard.setValue(newValue, forKey: key)
            }
        }
        
        static func getStorage(key : String) -> Help.LocalStorage<T> {
            let storage: Help.LocalStorage<T> = LocalStorage<T>(key: key)
            return storage
        }
        
    }
    
}

enum AppKeys : String {
    case api_key = "local_storage_api_key"
    var value : String {
        switch self {
        case .api_key:
            return "77632da6f1454e42ac89793a889d264b"
        }
    }
}
    


