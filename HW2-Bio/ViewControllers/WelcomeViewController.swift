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
    
    var person: User?
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // Обновляем градиент при изменении ориентации
        addGradient()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let person = person {
            let fullName = person.name + " " + person.surname
            
            greetingLabel.text? = "Welcome, " + person.login + "!"
            fullNameLabel.text? = "My name is " + fullName
            
            tabBarController?.tabBar.items?[1].title = fullName
        }
    }
}
