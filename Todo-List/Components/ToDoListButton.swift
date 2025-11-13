//
//  ToDoListButton.swift
//  Todo-List
//
//  Created by miniOrange Inc on 12/10/25.
//

import SwiftUI

struct ToDoListButton: View {
    let title: String;
    let backgroundColor: Color;
    let action: () -> Void;
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(backgroundColor)
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    ToDoListButton(
        title: "Default",
        backgroundColor: Color(.white)
    ){}
}
