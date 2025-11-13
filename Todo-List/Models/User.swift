//
//  User.swift
//  Todo-List
//
//  Created by miniOrange Inc on 08/10/25.
//

import Foundation


struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
