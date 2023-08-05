//
//  RealmManager.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/14/1402 AP.
//

import Foundation
import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    
    private var realm: Realm
    
    private var config = Realm.Configuration(encryptionKey: RealmKeyManager.shared.getKey() , schemaVersion: 2,
                                             
                                             // Set the block which will be called automatically when opening a Realm with
                                             // a schema version lower than the one set above
                                             migrationBlock: { migration, oldSchemaVersion in
        // We haven’t migrated anything yet, so oldSchemaVersion == 0
        if (oldSchemaVersion < 1) {
            // Nothing to do!
            // Realm will automatically detect new properties and removed properties
            // And will update the schema on disk automatically
        }
    })
    
    private init() {
        realm = try! Realm(configuration: config)
        
    }
    
    func saveToRealm<T: Object>(_ object: T)  {
        //  deleteObjectFromRealm(object)
        do {
            try realm.write {
                realm.add(object, update: .modified)
            }
        }
        catch {
            print("Error saving data To Realm")
        }
    }
    
    func deleteObjectFromRealm<T: Object>(_ object: T) {
        
        do {
            try realm.write {
                realm.delete(object)
            }
        }
        catch {
            
        }
    }
    
    func deleteAllDataInRealm() {
        do {
            try realm.write {
                realm.deleteAll()
            }
        }
        catch {
        }
    }
    
    
    func readFavoriteNews() -> Results<RealmNews> {
        let result: Results<RealmNews> = realm.objects(RealmNews.self)
        return result
    }
    
    
}


