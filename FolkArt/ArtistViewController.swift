//
//  ArtistViewController.swift
//  FolkArt
//
//  Created by Luke Karns on 3/9/17.
//  Copyright © 2017 Luke Karns. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController {
    
    var artist: Artist?
    
    // MARK: - Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var boothLabel: UILabel!
    @IBOutlet weak var mediaLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    
    // MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        profileImageView.image = UIImage(named: artist!.profileImageName)
        nameLabel.text = artist!.name
        countryLabel.text = artist!.country?.name
        boothLabel.text = "Booth #\(artist!.booth!.id)"
        mediaLabel.text = artist!.media?.name
        bioTextView.text = artist!.about
    }

    override func viewDidLayoutSubviews() {
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.bounds.size.width/2.0
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
