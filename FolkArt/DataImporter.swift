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
    
    static func importArtists() {
        
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
                
                //connect the booth
                if let artistDict = artistDict as? [String : Any] {
                    let booth = realm.objects(Booth.self).filter("id = \(artistDict["boothID"]!)").first!
                    artist.booth = booth
                }
            }
        }
    }
    static func importBooths() {
        
        // Build the file URL to the JSON
        guard let fileUrl = Bundle.main.url(forResource: "booths", withExtension: "json") else {assertionFailure("File URL could not be created."); return}
        
        // Open the file into a Data object
        var data: Data?
        do {
            data = try Data.init(contentsOf: fileUrl)
        } catch {
            assertionFailure("Data could not be initialized.")
            return
        }
        
        // Serialize the data into objects
        var jsonObjects: [[String : Any]]?
        do {
            jsonObjects = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [[String : Any]]
        } catch {
            assertionFailure("JSON objects could not be initialized.")
            return
        }
        
        // Import them into Realm
        let realm = try! Realm()
        try! realm.write {
            for boothDictionary in jsonObjects! {
                let booth = Booth()
                booth.latitude = (boothDictionary["BoothYLatitude"]! as! NSNumber).doubleValue
                booth.longitude = (boothDictionary["BoothXLongitude"]! as! NSNumber).doubleValue
                booth.id = (boothDictionary["BoothNumber"]! as! NSNumber).intValue
                
                realm.add(booth, update: true)
            }
        }
    }
}
