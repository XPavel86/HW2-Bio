//
//  User.swift
//  HW2-Bio
//
//  Created by Pavel Dolgopolov on 21.02.2024.
//
import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
     static func getPerson() -> User {
        User (
            login: "User",
            password: "123",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let yearOfBirth: String
    let city: String
    let profession: String
    let photos: [String]
    let biography: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(
            name: "Pavel",
            surname: "Dolgopolov",
            yearOfBirth: "28.10.2000",
            city: "Moscow",
            profession: "Engineer",
            photos: [
                "person.crop.artframe",
                "person.crop.artframe",
                "person.crop.artframe"
            ],
            
            biography: """
Meet our character. He is a true connoisseur of water spaces and places where nature merges with water elements. You can find it on the wave while kitesurfing!

In addition to water adventures, our character finds inspiration in new technologies and activities. His passion for electronics and programming allows him to implement unusual projects.

After many years of working in Moscow, he found his corner in the beautiful Crimea, where every day is filled with new discoveries and inspiration.

Our character is also a big fan of Mercedes cars, cats and Soviet science fiction. You can see about this and much more in the photo section.
"""
        )
    }
}


