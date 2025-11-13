//
//  TodoListItemViewModel.swift
//  Todo-List
//
//  Created by miniOrange Inc on 08/10/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// Single Item for Items List view
class TodoListItemViewViewModel: ObservableObject {
    
    init() {}
    
    func toggleIsDone(item: TodoListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}

