//
//  WelcomeViewController.swift
//  HW2-6
//
//  Created by Pavel Dolgopolov on 18.02.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet var greetingLabel: UILabel!
    @IBOutlet var fullNameLabel: UILabel!
    
    @IBOutlet var logOutButton: UIButton!
    
    var person: Person?
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addGradient()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let person = person {
            
            
            greetingLabel.text? = "Welcome, " + person.name + "!"
            fullNameLabel.text? = "My name is " + person.fullName
            
            tabBarController?.tabBar.items?[1].title = person.fullName
        }
    }
}
