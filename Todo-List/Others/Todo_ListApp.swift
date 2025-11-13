//
//  Todo_ListApp.swift
//  Todo-List
//
//  Created by miniOrange Inc on 08/10/25.
//
import FirebaseCore
import SwiftUI

@main
struct Todo_ListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
