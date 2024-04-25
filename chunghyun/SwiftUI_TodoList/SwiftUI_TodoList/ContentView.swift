//
//  ContentView.swift
//  SwiftUI_TodoList
//
//  Created by Chung Wussup on 4/25/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var isPresnting: Bool = false
    @Query var todos: [Todo] = [Todo(completed: false, descrip: "Wake up", priority: .low ),
                                Todo(completed: false, descrip: "Shower", priority: .medium),
                                Todo(completed: false, descrip: "Code", priority: .high),
                                Todo(completed: false, descrip: "Eat", priority: .high ),
                                Todo(completed: false, descrip: "Sleep", priority: .high),
                                Todo(completed: false, descrip: "Get groceries", priority: .high)]
    @Environment(\.modelContext) var modelContext
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todos) {todo in
                    HStack {
                        Button {
                            todo.completed.toggle()
                        } label: {
                            Image(systemName: todo.completed ? "checkmark.circle": "circle")
                                .foregroundStyle(todo.completed ? .red : .black)
                        }
                        
                        Text("\(todo.descrip)")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(todoTextColor(todo))
                            .strikethrough(todo.completed, color: .red)
                            

                        if todo.priority == .high {
                             Spacer()
                             Image(systemName: "star.fill")
                                 .renderingMode(.original)
                         }
                    }
                }
                .onDelete(perform: { indexSet in
                    deleteTodo(index: indexSet)
                })
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        isPresnting.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationTitle("To do List")
        }
        .sheet(isPresented: $isPresnting) {
            AddTodoView(isPresented: $isPresnting)
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
    
    func deleteTodo(index: IndexSet) {
        index.forEach { index in
            let todo = todos[index]
            modelContext.delete(todo)
        }
    }
}




#Preview {
    ContentView()
        .modelContainer(for: Todo.self)
}
