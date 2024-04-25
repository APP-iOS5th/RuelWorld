//
//  ContentView.swift
//  TodoList
//
//  Created by user on 4/25/24.
//

import SwiftUI

struct ContentView {
    @State var tasks : [Task] = Task.tasks
    @State var inputTask : Task = Task()
    
    @State var editDisabled = true
    
    private func addItemToRow() {
        tasks.append(inputTask)
        tasks.sort(by: { $0.priority < $1.priority })
        inputTask = Task()
    }
    
    private func moveRow(
        source: IndexSet,
        destination: Int
    ) {
        tasks.move(
            fromOffsets: source,
            toOffset: destination
        )
    }
    
    private func deleteRow(
        indexSet: IndexSet
    ) {
        tasks.remove(atOffsets: indexSet)
    }
}

extension ContentView: View {
    var todoInputView : some View {
        
        NavigationStack {
            VStack(alignment:.leading) {
                Text("1. Input Description")
                TextField("Todo Item", text: $inputTask.description)
                Divider()
                Text("2. Select Priority")
                Picker("Priority", selection: $inputTask.priority) {
                    ForEach(
                        Priority.allCases,
                        id: \.self
                    ) { priority in
                        Text(priority.rawValue)
                            .tag(priority)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Divider()
                Toggle(
                    "3. Select Complete",
                    isOn: $inputTask.completed
                )
                
            }
            .padding(20)
            .navigationTitle("Todo Input")
            .toolbar {
                ToolbarItem(
                    placement: .topBarTrailing
                ) {
                    Button("Add") {
                        addItemToRow()
                    }
                }
                ToolbarItem(
                    placement: .topBarLeading
                ) {
                    EditButton()
                }
            }
        }.frame(height: 280)
        
        
        
    }
    
    var todoListView : some View {
        NavigationStack {
            List() {
                ForEach(tasks) { task in
                    HStack {
                        Image(
                            systemName: task.completed ?
                            "checkmark.circle" :
                                "circle"
                        )
                        Text(task.description)
                        Spacer()
                        Text(task.priority.rawValue)
                    }
                    
                }
                .onMove(perform: moveRow)
                .onDelete(perform: deleteRow)
            }
            .navigationTitle("To do List")
        }
    }
    
    var body: some View {
        todoInputView
        todoListView
    }
}

#Preview {
    ContentView()
}
