//
//  LoginVIewModel.swift
//  Todo-List
//
//  Created by miniOrange Inc on 08/10/25.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        
//        Try Login
        Auth.auth().signIn(withEmail: email, password: password)
        
        print("Called");
    }
    
    func validate() -> Bool {
        errorMessage = "";
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all the fields"
            return false
        }

        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email"
            return false
        }
        
        return true;
    }
}
