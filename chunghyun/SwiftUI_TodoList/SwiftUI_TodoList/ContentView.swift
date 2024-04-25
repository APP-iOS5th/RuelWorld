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
    @Query var todos: [Todo] = [Todo(completed: false, descrip: "Wake up", priority: .low )]
    @Environment(\.modelContext) var modelContext
    
    
    var body: some View {
        NavigationStack {
            List {
                DisclosureGroup("High") {
                    ForEach(todos.filter({ $0.priority == .high })) { todo in
                        TodoRow(todo: todo)
                    }
                    .onDelete(perform: { indexSet in
                        deleteTodo(index: indexSet)
                    })
                }
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.red)
                .padding()
                
                DisclosureGroup("Medium") {
                    ForEach(todos.filter({ $0.priority == .medium })) { todo in
                        TodoRow(todo: todo)
                    }
                    .onDelete(perform: { indexSet in
                        deleteTodo(index: indexSet)
                    })
                }
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.green)
                .padding()
                
                DisclosureGroup("Low") {
                    ForEach(todos.filter({ $0.priority == .low })) { todo in
                        TodoRow(todo: todo)
                    }
                    .onDelete(perform: { indexSet in
                        deleteTodo(index: indexSet)
                    })
                }
                .font(.system(size: 20, weight: .semibold))
                .padding()
            }
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        isPresnting.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
#endif
                ToolbarItem {
                    Button {
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
