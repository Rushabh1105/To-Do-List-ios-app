//
//  NewItemViewModel.swift
//  Todo-List
//
//  Created by miniOrange Inc on 08/10/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    @Published var title: String = "";
    @Published var showAlert: Bool = false;
    @Published var dueDate: Date = Date();
    
    init() {}
    
    func save() {
        guard canSave else {
            return;
        }
        // Get current user ID
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Model
        let newId = UUID().uuidString
        let newItem = TodoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        // Save
        let db = Firestore.firestore();
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false;
        }
        
        return true;
    }
}

