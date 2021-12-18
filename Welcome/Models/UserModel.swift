//
//  UserModel.swift
//  Welcome
//
//  Created by Тагир Садыков on 18.12.2021.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            login: "oki",
            password: "doki",
            person: Person.getPerson())
    }
    
}


struct Person {
    let name: String
    let birthYear: Int
    let hobby: String
    let info: String
    
    static func getPerson() -> Person {
        Person(
            name: "Ольга Васильева",
            birthYear: 1986,
            hobby: "Бег на длинные дистанции",
            info:   "Люблю грозу в начале мая!")
    }
    
}
