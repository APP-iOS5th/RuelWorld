//
//  Task.swift
//  TodoList2
//
//  Created by Song Kim on 4/25/24.
//

import Foundation
import SwiftData

@Model
final class Task {
    var id = UUID()
    var name: String
    var isFinished: Bool
    
    init(name: String, isFinished: Bool) {
        self.name = name
        self.isFinished = isFinished
    }
}
