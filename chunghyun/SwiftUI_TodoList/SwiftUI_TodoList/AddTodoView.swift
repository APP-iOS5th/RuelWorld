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
    @State var priorityTitle: String = "내용을 입력하세요"
    @State var isAlert: Bool = false
    
    var body: some View {
        VStack{
            Text("Todo 등록")
                .padding()
            
            HStack {
                TextField("내용을 입력하세요", text: $todo)
                
                Menu(priorityTitle) {
                    Button("High") {
                        priority = .high
                        priorityTitle = priorityTitle(.high)
                    }
                    
                    Button("Medium") {
                        priority = .medium
                        priorityTitle = priorityTitle(.medium)
                    }
                    
                    Button("Low") {
                        priority = .low
                        priorityTitle = priorityTitle(.low)
                    }
                    
                }
                .foregroundStyle(priorityTextColor(priority))
                
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
        .alert("내용이 없습니다.",isPresented: $isAlert) {
            Button("OK", role: .cancel) {
                isAlert.toggle()
            }
        }
    }
    
    func priorityTextColor(_ priority: Priority) -> Color {
        switch priority {
        case .high:
            return .red
        case .medium:
            return .green
        case .low:
            return .black
        }
        
    }
    func priorityTitle(_ priority: Priority) -> String {
        switch priority {
        case .high:
            return "High"
        case .medium:
            return "Medium"
        case .low:
            return "Low"
        }
        
    }
    
    func addTodo() {
        if todo.isEmpty {
            isAlert.toggle()
        } else {
            let todo = Todo(completed: false, descrip: todo, priority: priority)
            modelContext.insert(todo)
            self.isPresented = false
        }
    }
    
    
    
}

#Preview {
    AddTodoView(isPresented: .constant(false))
}
