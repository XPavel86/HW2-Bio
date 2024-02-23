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
    let photo: UIImage
    let biography: String
    
    static func getPerson() -> User {
        let myPhoto = UIImage(named: "MyPhoto") ??
        UIImage(systemName: "person.crop.artframe")! // command + shift + L

        return User(
            login: "User",
            password: "123",
            name: "Павел",
            surname: "Долгополов",
            yearOfBirth: "28.10.2000",
            city: "Москва",
            profession: "Engineer",
            photo: myPhoto,
            biography: """
Встретьте нашего персонажа, чей дух неукротим и чье сердце принадлежит приключениям! Он — настоящий ценитель водных просторов и мест, где природа сливается с водными элементами. Какое блаженство наблюдать за игрой волн на океане или наслаждаться катанием на волне во время кейтсерфинга!

Помимо водных приключений, наш персонаж находит вдохновение в стремлении к новым технологиям и занятиям. Его увлечение электроникой и программированием позволяют ему воплощать необычные проекты.

Он ценит комфорт, особенно вождение на мощных автомобилях. В свободное время вы часто найдете его за рулем своего любимого Мерседеса, погруженного в атмосферу свободы и скорости.

Жизнь нашего путешественника пронизана разнообразием и приключениями. После долгих лет работы в Москве он нашел свой уголок в прекрасном Крыму, где каждый день наполнен новыми открытиями и вдохновением.
"""
        )
    }
}

/*
 Более короткий вариант. Как лучше ?
 
 enum Person: String {
     case login = "User"
     case password = "123"
     case name = "Pavel"
     case surname = "Dolgopolov"
     ...
 }
}

 */
