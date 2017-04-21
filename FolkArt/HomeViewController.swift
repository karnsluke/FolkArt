//
//  ViewController.swift
//  FolkArt
//
//  Created by Luke Karns on 4/20/17.
//  Copyright © 2017 Luke Karns. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func searchArtistsButtonPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SearchViewController")
            as? SearchViewController
        show(vc!, sender: self)
    }
    @IBAction func viewAllArtistsButtonPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ArtistsTableViewController") as? ArtistsTableViewController
        show(vc!, sender: self)
    }
    @IBAction func viewMapButtonPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController
        show(vc!, sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
