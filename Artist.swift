//
//  Artist.swift
//  FolkArt
//
//  Created by Tyler White on 3/23/17.
//  Copyright © 2017 Luke Karns. All rights reserved.
//

import Foundation
import RealmSwift

class Artist: Object {
    dynamic var name = ""
    dynamic var about = ""
    dynamic var mediaOfWork = ""
    dynamic var profileImageName = ""
    dynamic var artImageName = ""
    dynamic var booth: Booth?
    dynamic var country: Country?
    dynamic var media: Media?
    
    override static func primaryKey() -> String? {
        return "name"
    }
}
