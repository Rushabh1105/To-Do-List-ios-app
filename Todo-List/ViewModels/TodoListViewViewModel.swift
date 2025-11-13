//
//  TodoListViewModel.swift
//  Todo-List
//
//  Created by miniOrange Inc on 08/10/25.
//

import Foundation
import FirebaseFirestore

class TodoListViewViewModel: ObservableObject {
    @Published var showingNewItemView: Bool = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        print("called")
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
