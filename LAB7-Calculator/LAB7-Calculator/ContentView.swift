//
//  ContentView.swift
//  LAB7-Calculator
//
//  Created by Chung Wussup on 4/18/24.
//

import SwiftUI

struct textData {
    
}

struct ButtonView: View {
    
    
    let calChar: String
    let buttonColor: Color
    var body: some View {
        Button(calChar) {
            print(calChar)
        }
        .frame(width: 80, height: 100)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        .background(buttonColor)
    }
}

struct FullTextAreaView: View {
    @Binding var calText: String
    var body: some View {
        Text("\(calText)")
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
                ButtonView(calChar: "00",
                           buttonColor: numberColor)
                ButtonView(calChar: "0",
                           buttonColor: numberColor)
                ButtonView(calChar: ".",
                           buttonColor: numberColor)
                ButtonView(calChar: "/",
                           buttonColor: operationColor)
            }
            HStack {
                ButtonView(calChar: "C",
                           buttonColor: actionColor)
                ButtonView(calChar: "DEL",
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
    @State private var calText:String = "000"
    
    var body: some View {
        VStack {
            FullTextAreaView(calText: $calText)
            InputButtonAreaView()
        }
        .padding()
        .font(.largeTitle)
    }
}

#Preview {
    ContentView()
}
