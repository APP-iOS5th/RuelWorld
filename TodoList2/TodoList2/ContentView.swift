//
//  ContentView.swift
//  TodoList2
//
//  Created by Song Kim on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    @State var todoLists: [Task] = [Task(name: "밥먹기", isFinished: false), Task(name: "놀기", isFinished: false)]
    @State var newTaskName: String = ""
    @State var error: Bool = false
    
    var body: some View {
        VStack {
            Text("Todo List")
                .font(.largeTitle)
                .bold()
            
            HStack {
                TextField("할 일 입력", text: $newTaskName)
                    .padding()
                    .frame(height: 50)
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(8)
                    .padding(.leading)
                
                Button(action: {
                    if !newTaskName.isEmpty {
                        todoLists.append(Task(name: newTaskName, isFinished: false))
                        newTaskName = ""
                    } else {
                        error = true
                    }
                }) {
                    Text("추가")
                        .font(.title3)
                }
                .padding(.trailing)
            }
            .alert(isPresented: $error) {
                Alert(title: Text("Error"), message: Text("항목을 입력하세요"), dismissButton: .default(Text("close")))
            }
            .padding(.horizontal)
            
            TodoListView(todoLists: $todoLists)
                .padding(.horizontal)
        }
    }
}


#Preview {
    ContentView()
}
