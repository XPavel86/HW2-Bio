//
//  ShortInfoViewController.swift
//  HW2-Bio
//
//  Created by Pavel Dolgopolov on 23.02.2024.
//

import UIKit

class ShortInfoViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet var infoStack: UIStackView!
    //@IBOutlet var NameLabel: UILabel!
    @IBOutlet var myPhoto: UIImageView!
   // @IBOutlet var photoStack: UIStackView!
    
    //MARK: - Private Properties
    var person: User?
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        addGradient()
        
//        // Установка равной ширины и высоты
//       // myPhoto.widthAnchor.constraint(equalTo: myPhoto.heightAnchor).isActive = true
//        // Получение ровного круга
//        photoStack.layer.cornerRadius = photoStack.frame.height / 2
//        //myPhoto.clipsToBounds = true
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
