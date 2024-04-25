//
//  ContentView.swift
//  TodoList
//
//  Created by Song Kim on 4/25/24.
//

import SwiftUI
import SwiftData

struct Task {
    var name: String
    var isFinished: Bool
}

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                configuration.label
            }
        })
    }
}

struct ContentView: View {
    @State var todoLists: [Task] = [Task(name: "밥먹기", isFinished: false), Task(name: "놀기", isFinished: false)]
    @State var newTaskName: String = ""
    @State var error: Bool = false
    
    var body: some View {
        VStack {
            Text("Todo List")
                .font(.largeTitle)
            HStack {
                TextField("할 일 입력", text: $newTaskName)
                    .padding()
                    .frame(height: 33)
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(8)
                    .padding(.leading)
                Button {
                    if !newTaskName.isEmpty{
                        todoLists.append(Task(name: newTaskName, isFinished: false))
                        newTaskName = ""
                    } else {
                        error = true
                    }
                } label: {
                    Text("추가")
                        .font(.title3)
                }
                .padding(.trailing)
                .alert(isPresented: $error) {
                    Alert(title: Text("Error"), message: Text("항목을 입력하세요"), dismissButton: .default(Text("close")))
                }
            }
            
            List {
                ForEach(todoLists.indices, id: \.self) { index in
                    Toggle(isOn: $todoLists[index].isFinished) {
                        Text(todoLists[index].name)
                    }
                    .toggleStyle(iOSCheckboxToggleStyle())
                }
                .onDelete(perform: { indexSet in
                    todoLists.remove(atOffsets: indexSet)
                })
            }
        }
    }
}


#Preview {
    ContentView()
}
