//
//  User.swift
//  HW2-Bio
//
//  Created by Pavel Dolgopolov on 21.02.2024.
//

import UIKit

struct User {
    let login: String
    let password: String
    let name: String
    let surname: String
    let yearOfBirth: String
    let city: String
    let profession: String
    let photos: [UIImage]
    let biography: String
   
    static func getPerson() -> User {
        let myPhotos: [UIImage] = [
            "MyPhoto",
            "MyCat",
            "Mers",
            "SovetFan"
        ]
            .map {
                UIImage(named: $0) ?? UIImage(systemName: "person.crop.artframe")!
        }
        
        return User(
            login: "User",
            password: "123",
            name: "Павел",
            surname: "Долгополов",
            yearOfBirth: "28.10.2000",
            city: "Москва",
            profession: "Engineer",
            photos: myPhotos,
            biography: """
Встретьте нашего персонажа. Он — настоящий ценитель водных просторов и мест, где природа сливается с водными элементами. Вы можете его обнаружить на волне во время катания на кейтсерфинге!

Помимо водных приключений, наш персонаж находит вдохновение в новых технологиях и занятиях. Его увлечение электроникой и программированием позволяют ему воплощать необычные проекты.

После долгих лет работы в Москве он нашел свой уголок в прекрасном Крыму, где каждый день наполнен новыми открытиями и вдохновением.

Также наш персонаж является большим любителем мерсов, кошек и советской фантастики. Об этом и о многом другом вы можете посмотреть в разделе фото.
"""
        )
    }
}


