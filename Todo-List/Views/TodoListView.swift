//
//  TodoListItems.swift
//  Todo-List
//
//  Created by miniOrange Inc on 08/10/25.
//

import SwiftUI
import FirebaseFirestore

struct TodoListView: View {
    @StateObject var viewModel: TodoListViewViewModel;
    @FirestoreQuery var items: [TodoListItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos",
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) {
                    item in
                    TodoListItemView(item: item)
                        .swipeActions {
                            Button ("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("ToDo List")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(
                    newItemPresented: $viewModel.showingNewItemView
                )
            }
        }
    }
}

#Preview {
    TodoListView(userId: "")
}
