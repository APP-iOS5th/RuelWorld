//
//  ContentView.swift
//  TodoList
//
//  Created by Song Kim on 4/25/24.
//

import SwiftUI

struct Task {
    var name: String
    var isFinished: Bool
}

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
            
            List {
                ForEach(todoLists.indices, id: \.self) { index in
                    HStack {
                        Button(action: {
                            todoLists[index].isFinished.toggle()
                        }) {
                            Image(systemName: todoLists[index].isFinished ? "checkmark.square.fill" : "square")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blue)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Text(todoLists[index].name)
                            .foregroundColor(todoLists[index].isFinished ? .gray : .primary)
                            .strikethrough(todoLists[index].isFinished, color: .gray)
                            .padding(.leading, 5)
                    }
                }
                .onDelete(perform: { indexSet in
                    todoLists.remove(atOffsets: indexSet)
                })
            }
            .padding(.horizontal)
            .listStyle(PlainListStyle())
        }
    }
}


#Preview {
    ContentView()
}
