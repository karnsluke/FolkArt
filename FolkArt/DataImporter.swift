//
//  DataImporter.swift
//  FolkArt
//
//  Created by Tyler White on 3/23/17.
//  Copyright © 2017 Luke Karns. All rights reserved.
//

import Foundation
import RealmSwift

class DataImporter {
    
    static func importData() {
        
        // Build the file URL to the JSON
        guard let fileUrl = Bundle.main.url(forResource: "folkart", withExtension: "json") else {assertionFailure("File URL could not be created."); return}
    
        // Open the file into a Data object
        var data: Data?
        do {
            data = try Data.init(contentsOf: fileUrl)
        } catch {
            assertionFailure("Data could not be initialized.")
            return
        }
        
        // Serialize the data into objects
        var jsonObjects: [String : [Any]]?
        do {
            jsonObjects = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String : [Any]]
        } catch {
            assertionFailure("JSON objects could not be initialized.")
            return
        }
        
        // Import them into Realm
        let realm = try! Realm()
        try! realm.write {
            for artistDict in jsonObjects!["artists"]! {
                let artist = Artist(value: artistDict)
                realm.add(artist, update: true)
            }
        }
    }
}
