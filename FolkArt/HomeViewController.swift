//
//  ViewController.swift
//  FolkArt
//
//  Created by Luke Karns on 3/9/17.
//  Copyright © 2017 Luke Karns. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - IBActions
    @IBAction func searchButtonPressed(_ sender: UIButton) {
    }
    @IBAction func countryButtonPressed(_ sender: UIButton) {
    }
    @IBAction func mediaButtonPressed(_ sender: UIButton) {
    }
    @IBAction func viewMapButtonPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController
        show(vc!, sender: self)
    }
    @IBAction func allButtonPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ArtistsTableViewController") as? ArtistsTableViewController
        show(vc!, sender: self)
    }
    
    // MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

