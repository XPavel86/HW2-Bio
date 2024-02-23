//
//  BiographyViewController.swift
//  HW2-Bio
//
//  Created by Pavel Dolgopolov on 23.02.2024.
//

import UIKit

class BiographyViewController: UIViewController {

    @IBOutlet var biographyTextView: UITextView!
  
    var biographyText: String!
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addGradient()
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        biographyTextView.text = biographyText
    }
}
