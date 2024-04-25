//
//  SwiftUI_TodoListApp.swift
//  SwiftUI_TodoList
//
//  Created by Chung Wussup on 4/25/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftUI_TodoListApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Todo.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(sharedModelContainer)
        }
    }
    
    @MainActor private func initialzeData() {
        do {
            //데이터베이스가져오기
            let fetchDescriptor = FetchDescriptor<Todo>()
            let fetchedTodos = try sharedModelContainer.mainContext.fetch(fetchDescriptor)
   
            if fetchedTodos.isEmpty {
                for todo in Todo.tasks {
                    sharedModelContainer.mainContext.insert(todo)
                }
            }
            
        } catch {
            print("Failed \(error)")
        }
    }
}
