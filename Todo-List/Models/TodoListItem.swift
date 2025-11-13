//
//  TodoListItem.swift
//  Todo-List
//
//  Created by miniOrange Inc on 08/10/25.
//

import Foundation

struct TodoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    
    var isDone: Bool
    
    mutating func setDone (_ state: Bool) {
        isDone = state
        
    }
}
