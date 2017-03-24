//
//  Country.swift
//  FolkArt
//
//  Created by Tyler White on 3/23/17.
//  Copyright © 2017 Luke Karns. All rights reserved.
//

import Foundation
import RealmSwift

class Country: Object {
    dynamic var name = ""
    let artists = LinkingObjects(fromType: Artist.self, property: "country")
    
    override static func primaryKey() -> String? {
        return "name"
    }
}
