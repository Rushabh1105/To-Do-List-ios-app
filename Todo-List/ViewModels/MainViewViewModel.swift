//
//  MainViewModel.swift
//  Todo-List
//
//  Created by miniOrange Inc on 08/10/25.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    @Published var curruntUserId: String = "";
    private var handler: AuthStateDidChangeListenerHandle?;
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener{[weak self] _, user in
            DispatchQueue.main.async {
                self?.curruntUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
