//
//  ShortInfoViewController.swift
//  HW2-Bio
//
//  Created by Pavel Dolgopolov on 23.02.2024.
//

import UIKit

final class ShortInfoViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet var infoStack: UIStackView!
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
            myPhoto.image = person.photos[0]
      
            addNewLabel(stackView: infoStack, text: "Имя: " + person.name)
            addNewLabel(stackView: infoStack, text: "Фамилия: " + person.surname)
            addNewLabel(stackView: infoStack, text: "Год рождения: " + person.yearOfBirth)
            addNewLabel(stackView: infoStack, text: "Город: " + person.city)
            addNewLabel(stackView: infoStack, text: "Профессия: " + person.profession)
        } 
    }
    
    // MARK: - Overrides Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let biographyVC = segue.destination as? BiographyViewController
        biographyVC?.person = person
    }
    
    // MARK: - Private Methods
    private func addNewLabel(stackView: UIStackView, text: String) {
        let label = UILabel()
        label.text = text
        stackView.addArrangedSubview(label)
    }
}
