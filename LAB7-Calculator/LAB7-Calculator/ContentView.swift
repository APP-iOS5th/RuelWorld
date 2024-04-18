//
//  ContentView.swift
//  LAB7-Calculator
//
//  Created by Chung Wussup on 4/18/24.
//

import SwiftUI

class SharedData: ObservableObject {
    
    @Published var calText: String = ""
    
    func buttonAction (calChar: String) {
        calText += calChar
        print(calText)
    }
    
    func resetAction () {
        calText = ""
    }
    
    func backspaceAction () {
        if !calText.isEmpty {
            calText.removeLast()
        }
    }
    
    func calculate() {
        guard !calText.isEmpty else {
            return
        }
        
        let expression = NSExpression(format: calText)
        if let value = expression.expressionValue(with: nil, context: nil) as? Double {
            calText = String(value)
        } else {
            calText = "Invalid input"
        }
    }
    
}

struct ButtonView: View {
    @EnvironmentObject var shared: SharedData
    
    let calChar: String
    let buttonColor: Color
    
    var body: some View {
        Button(calChar) {
            switch(calChar) {
            case "=" : shared.calculate()
            case "Del" : shared.backspaceAction()
            case "C" : shared.resetAction()
            default :shared.buttonAction(calChar: calChar)
            }
        }
        .frame(width: 80, height: 100)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        .background(buttonColor)
    }
}

struct FullTextAreaView: View {
    @EnvironmentObject var shared: SharedData
    
    var body: some View {
        Text(shared.calText)
            .frame(width: 300, height: 70, alignment: .trailing)
            .padding(.horizontal, 22)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
}

struct InputButtonAreaView: View {
    
    let numberColor = Color.teal
    let operationColor = Color.green
    let actionColor  = Color.orange
    var body: some View {
        VStack {
            HStack {
                ButtonView(calChar: "7",
                           buttonColor: numberColor)
                ButtonView(calChar: "8",
                           buttonColor: numberColor)
                ButtonView(calChar: "9",
                           buttonColor: numberColor)
                ButtonView(calChar: "+",
                           buttonColor: operationColor)
            }
            HStack {
                ButtonView(calChar: "4",
                           buttonColor: numberColor)
                ButtonView(calChar: "5",
                           buttonColor: numberColor)
                ButtonView(calChar: "6",
                           buttonColor: numberColor)
                ButtonView(calChar: "-",
                           buttonColor: operationColor)
            }
            HStack {
                ButtonView(calChar: "1",
                           buttonColor: numberColor)
                ButtonView(calChar: "2",
                           buttonColor: numberColor)
                ButtonView(calChar: "3",
                           buttonColor: numberColor)
                ButtonView(calChar: "*",
                           buttonColor: operationColor)
            }
            HStack {
                ButtonView(calChar: ".",
                           buttonColor: numberColor)
                ButtonView(calChar: "0",
                           buttonColor: numberColor)
                ButtonView(calChar: "00",
                           buttonColor: numberColor)
                ButtonView(calChar: "/",
                           buttonColor: operationColor)
            }
            HStack {
                ButtonView(calChar: "C",
                           buttonColor: actionColor)
                ButtonView(calChar: "Del",
                           buttonColor: actionColor)
                ButtonView(calChar: "=",
                           buttonColor: actionColor)
                ButtonView(calChar: "%",
                           buttonColor: operationColor)
            }
        }
    }
}

struct ContentView: View {
    @StateObject var shared = SharedData()
    
    var body: some View {
        VStack {
            FullTextAreaView()
            InputButtonAreaView()
        }
        .padding()
        .font(.largeTitle)
        .environmentObject(shared)
    }
}

#Preview {
    ContentView()
}
