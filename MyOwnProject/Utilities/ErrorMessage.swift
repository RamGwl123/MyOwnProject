//
//  ErrorMessage.swift
//  MyOwnProject
//
//  Created by Ram Naidu on 10/10/24.
//

import Foundation

enum GFError: String, Error {
    case invalidusers           = "This username created an invalide request. please try again"
    case unableToComplete       = "Unable to complete your request. please check your internet connection"
    case invalidResponse        = "Invalid response from the server. Please try again."
    case invalidData            = "The data received from the server was invalid. Please try again."
}
