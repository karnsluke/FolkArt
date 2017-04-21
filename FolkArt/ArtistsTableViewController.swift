//
//  ArtistsTableViewController.swift
//  FolkArt
//
//  Created by Tyler White on 3/23/17.
//  Copyright © 2017 Luke Karns. All rights reserved.
//

import UIKit
import RealmSwift

class ArtistsTableViewController: UITableViewController {

    let realm = try! Realm()
    let results = try! Realm().objects(Artist.self)
    let artistCellIdentifier = "ArtistCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return results.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: artistCellIdentifier, for: indexPath) as! ArtistTableViewCell

        // Configure the cell...
        let artist = results[indexPath.row]
        cell.textLabel?.text = artist.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let artist = results[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ArtistViewController") as? ArtistViewController
        vc?.artist = artist
        show(vc!, sender: self)
    }
    
}
