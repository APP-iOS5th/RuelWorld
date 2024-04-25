//
//  AddTodoView.swift
//  SwiftUI_TodoList
//
//  Created by Chung Wussup on 4/25/24.
//

import SwiftUI

struct AddTodoView: View {
    @Binding var isPresented: Bool
    @Environment(\.modelContext) var modelContext

    @State var priority: Priority = .low
    
    @State var todo: String = ""
    
    var body: some View {
        VStack{
            Text("Todo 등록")
            
            HStack {
                TextField("내용을 입력하세요", text: $todo)
                
                Menu("우선순위") {
                    Button("High") {
                        priority = .high
                    }
                    Button("Medium") {
                        priority = .medium
                    }
                    Button("Low") {
                        priority = .low
                    }
                }
                .foregroundStyle(.black)
                
            }
            .padding()
            Divider()
            
            
            Button {
                addTodo()
            } label: {
                Text("등록")
            }
            
            Spacer()
        }
    }
    
    func addTodo() {
        let todo = Todo(completed: false, descrip: todo, priority: priority)
        modelContext.insert(todo)
        self.isPresented = false
    }
    
}

#Preview {
    AddTodoView(isPresented: .constant(false))
}
