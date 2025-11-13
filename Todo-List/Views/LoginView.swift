//
//  LoginView.swift
//  Todo-List
//
//  Created by miniOrange Inc on 08/10/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
    //            Header
                HeaderView(
                    title: "To Do List", subtitle: "Get Things Done", rotationAngle: 15, backgroundColor: .pink
                )
                
    //            LoginForm
                Form {
    //           Error Message
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    ToDoListButton(
                        title: "Login",
                        backgroundColor: .blue
                    ) {
                        viewModel.login();
                    }
                }
                .offset(y: -50)
                
    //            Create Account
                VStack {
                    Text("New around here...")
                    NavigationLink("Create An Account", destination: RegistrationView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
