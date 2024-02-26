//
//  BiographyViewController.swift
//  HW2-Bio
//
//  Created by Pavel Dolgopolov on 23.02.2024.
//

import UIKit

class BiographyViewController: UIViewController {
    
    @IBOutlet var biographyTextView: UITextView!
    
    var person: User?
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addGradient()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        biographyTextView.text = person?.biography
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let photoVC = segue.destination as? PhotoViewController
        photoVC?.person = person
        print("Go to photo >>")
    }
}
