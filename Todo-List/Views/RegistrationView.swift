//
//  RegistrationView'.swift
//  Todo-List
//
//  Created by miniOrange Inc on 08/10/25.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewViewModel()
    
    var body: some View {
        VStack {
            // Header
            HeaderView(
                title: "Registration", subtitle: "Start Organizing Todos", rotationAngle: -15, backgroundColor: .orange
            )
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                ToDoListButton(
                    title: "Create Account",
                    backgroundColor: .green
                ) {
                    // Attempt Registration
                    viewModel.register()
                }
                    .padding()
            }
            .offset(y: -50)
            
            
            Spacer()
        }
    }
}

#Preview {
    RegistrationView()
}
