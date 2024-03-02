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
    @IBOutlet var myPhoto: UIImageView! {
        didSet {
            myPhoto.layer.cornerRadius = myPhoto.frame.height / 2
        }
    }

    
    //MARK: - Private Properties
    var person: Person?
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addGradient()
    }

    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let person = person {
            navigationItem.title = person.fullName
            myPhoto.image = UIImage(named: person.photos.first!)
      
            addNewLabel(stackView: infoStack, text: "Name: " + person.name)
            addNewLabel(stackView: infoStack, text: "Surname: " + person.surname)
            addNewLabel(stackView: infoStack, text: "Year Of Birth: " + person.yearOfBirth)
            addNewLabel(stackView: infoStack, text: "City: " + person.city)
            addNewLabel(stackView: infoStack, text: "Profession: " + person.profession)
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
