//
//  TodoWidget.swift
//  TodoWidget
//
//  Created by Chung Wussup on 4/25/24.
//

import WidgetKit
import SwiftUI
import SwiftData


struct TaskEntry: TimelineEntry {
    let date: Date
    let task: Todo
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> TaskEntry {
        
        TaskEntry(date: Date(), task: .task)
    }

    func getSnapshot(in context: Context, completion: @escaping (TaskEntry) -> ()) {
        
        let entry = TaskEntry(date: Date(), task: .task)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [TaskEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = TaskEntry(date: entryDate, task: .task)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}


struct TodoWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Time:")
            Text(entry.date, style: .time)

            Text("Task:")
            Text(entry.task.descrip)
        }
    }
}

struct TodoWidget: Widget {
    let kind: String = "TodoWidget"
    
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
    
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                TodoWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
                    .modelContainer(sharedModelContainer)
            } else {
                TodoWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    TodoWidget()
        
} timeline: {
    TaskEntry(date: .now, task: Todo(completed: false, descrip: "배고파", priority: .high))
    TaskEntry(date: .now, task: Todo(completed: false, descrip: "왜안돼지", priority: .high))
    TaskEntry(date: .now, task: Todo(completed: false, descrip: "좀돼라~", priority: .high))
    
}
