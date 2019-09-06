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
}

struct Name: Decodable {
    let first: String
}
