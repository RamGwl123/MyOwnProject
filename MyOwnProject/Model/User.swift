//
//  User.swift
//  MyOwnProject
//
//  Created by Ram Naidu on 10/10/24.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRespos: Int
    var publicGists: Int
    var htmlUser: String
    var following: Int
    var followers: Int
    var createdAt: Date
}
