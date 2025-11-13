//
//  NewItemView.swift
//  Todo-List
//
//  Created by miniOrange Inc on 08/10/25.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel();
    @Binding var newItemPresented: Bool;
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                // Title
                TextField("title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // DueDate
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                ToDoListButton(title: "Save", backgroundColor: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true;
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields properly"))
            }
        }
    }
}

#Preview {
    NewItemView(
        newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        })
    )
}
