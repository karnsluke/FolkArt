//
//  Booth.swift
//  FolkArt
//
//  Created by Tyler White on 3/23/17.
//  Copyright © 2017 Luke Karns. All rights reserved.
//

import Foundation
import RealmSwift
import MapKit

class Booth: Object, MKAnnotation {
    dynamic var id = 0
    dynamic var latitude = 0.0
    dynamic var longitude = 0.0

    let artists = LinkingObjects(fromType: Artist.self, property: "booth")
    var coordinate: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2DMake(latitude, longitude)
        }
    }
    var title: String? {
        get {
            return "\(id)"
        }
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
