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
}
