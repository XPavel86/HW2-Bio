//
//  PhotoViewController.swift
//  HW2-Bio
//
//  Created by Pavel Dolgopolov on 25.02.2024.
//

import UIKit

final class PhotoViewController: UIViewController {
    
    @IBOutlet var photoStack: UIStackView!
    
    var person: User?
    
    // MARK: - Initializers
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addGradient()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let person = person {
            person.photos.dropFirst().forEach { element in
                addImage(stackView: photoStack, photo: element)
            }
        }
    }
    
    // MARK: - Private Methods
    private func addImage(stackView: UIStackView, photo: UIImage) {
        
        let image = UIImageView()
        let heightConstraint = NSLayoutConstraint(
            item: image,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 300
        )
        image.addConstraint(heightConstraint)
        image.contentMode = .scaleAspectFit
        image.image = photo
        
        stackView.addArrangedSubview(image)
    }
}
