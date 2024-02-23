//
//  ShortInfoViewController.swift
//  HW2-Bio
//
//  Created by Pavel Dolgopolov on 23.02.2024.
//

import UIKit

class ShortInfoViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet var shortInfoStack: UIStackView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var myPhoto: UIImageView!
    
    //MARK: - Private Properties
    var person: User?
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        addGradient()
    }
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let person = person {
            navigationItem.title = person.name + " " + person.surname
            
            myPhoto.image = person.photo
      
            addNewLabel(stackView: shortInfoStack, text: "Имя: " + person.name)
            addNewLabel(stackView: shortInfoStack, text: "Фамилия: " + person.surname)
            addNewLabel(stackView: shortInfoStack, text: "Год рождения: " + person.yearOfBirth)
            addNewLabel(stackView: shortInfoStack, text: "Город: " + person.city)
            addNewLabel(stackView: shortInfoStack, text: "Профессия: " + person.profession)
        } 
    }
    
    // MARK: - Overrides Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let viewController = segue.destination as? BiographyViewController
        viewController?.biographyText = person?.biography
    }
    
    // MARK: - Private Methods
    private func addNewLabel(stackView: UIStackView, text: String) {
        let label = UILabel()
        label.text = text
        stackView.addArrangedSubview(label)
    }
}
