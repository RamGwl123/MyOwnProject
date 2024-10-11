//
//  Follower.swift
//  MyOwnProject
//
//  Created by Ram Naidu on 10/10/24.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(login) // Assuming login is unique
    }
    
    static func == (lhs: Follower, rhs: Follower) -> Bool {
        return lhs.login == rhs.login // Compare by login
    }
}
