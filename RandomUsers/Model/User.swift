//
//  User.swift
//  RandomUsers
//
//  Created by Austin Potts on 9/5/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import Foundation

struct UserResult: Decodable {
    let results: [User]
}

struct User: Decodable{
    var name: Name
    var email: String
    var phone: String
    var picture: Picture
}

struct Name: Decodable {
    let first: String
    let last: String
    
}

struct Picture: Decodable {
    var thumbnail: URL
    var large: URL
}
