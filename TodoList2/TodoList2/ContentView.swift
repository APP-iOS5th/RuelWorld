//
//  ContentView.swift
//  TodoList2
//
//  Created by Song Kim on 4/25/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Task]
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
                        error = false
                        addItem()
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
                ForEach(items) { item in
                    HStack {
                        Button(action: {
                            item.isFinished.toggle()
                        }) {
                            Image(systemName: item.isFinished ? "checkmark.square.fill" : "square")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blue)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Text(item.name)
                            .foregroundColor(item.isFinished ? .gray : .primary)
                            .strikethrough(item.isFinished, color: .gray)
                            .padding(.leading, 5)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .listStyle(PlainListStyle())
                .padding(.horizontal)
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Task(name: newTaskName, isFinished: false)
            modelContext.insert(newItem)
            newTaskName = ""
        }
    }


    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}


#Preview {
    ContentView()
}
