//
//  TodoRow.swift
//  SwiftUI_TodoList
//
//  Created by Chung Wussup on 4/25/24.
//

import SwiftUI

struct TodoRow: View {
    var todo: Todo
    
    var body: some View {
        HStack {
           Button {
               todo.completed.toggle()
           } label: {
               Image(systemName: todo.completed ? "checkmark.circle": "circle")
                   .foregroundStyle(todo.completed ? .red : .black)
           }
           
           Text("\(todo.descrip)")
               .font(.system(size: 14, weight: .medium))
               .foregroundStyle(todoTextColor(todo))
               .strikethrough(todo.completed, color: .red)
           
           
           if todo.priority == .high {
               Spacer()
               Image(systemName: "star.fill")
                   .renderingMode(.original)
           }
       }
    }
    
    func todoTextColor(_ todo: Todo) -> Color {
        switch todo.priority {
        case .high:
            return .red
        case .medium:
            return .green
        case .low:
            return .black
        }
        
    }
}

#Preview {
    TodoRow(todo: Todo(completed: false, descrip: "Wake up", priority: .low ))
}
