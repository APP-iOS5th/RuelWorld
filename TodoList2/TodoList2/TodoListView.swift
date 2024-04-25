//
//  TodoListView.swift
//  TodoList2
//
//  Created by Song Kim on 4/25/24.
//

import SwiftUI

struct TodoListView: View {
    @Binding var todoLists: [Task]
    
    var body: some View {
        List {
            ForEach(todoLists.indices, id: \.self) { index in
                HStack {
                    Button(action: {
                        todoLists[index].isFinished.toggle()
                    }) {
                        Image(systemName: todoLists[index].isFinished ? "checkmark.square.fill" : "square")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Text(todoLists[index].name)
                        .foregroundColor(todoLists[index].isFinished ? .gray : .primary)
                        .strikethrough(todoLists[index].isFinished, color: .gray)
                        .padding(.leading, 5)
                }
            }
            .onDelete(perform: { indexSet in
                todoLists.remove(atOffsets: indexSet)
            })
        }
        .listStyle(PlainListStyle())
    }
}
