//
//  Task.swift
//  SwiftUI_TodoList
//
//  Created by Chung Wussup on 4/25/24.
//

import Foundation
import SwiftData

enum Priority: Codable {
    case high
    case medium
    case low
}

@Model
class Todo {
    var id = UUID()
    var completed: Bool 
    var descrip: String
    var priority: Priority
    
    init(id: UUID = UUID(), completed: Bool, descrip: String, priority: Priority) {
        self.id = id
        self.completed = completed
        self.descrip = descrip
        self.priority = priority
    }
}

extension Todo {
    static var tasks = [
        Todo(completed: false, descrip: "Wake up", priority: .low ),
        Todo(completed: false, descrip: "Shower", priority: .medium),
        Todo(completed: false, descrip: "Code", priority: .high),
        Todo(completed: false, descrip: "Eat", priority: .high ),
        Todo(completed: false, descrip: "Sleep", priority: .high),
        Todo(completed: false, descrip: "Get groceries", priority: .high)
    ]
    static var task = tasks[0]
}
