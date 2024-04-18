//
//  ContentView.swift
//  LAB7-Calculator
//
//  Created by Chung Wussup on 4/18/24.
//

import SwiftUI

enum CalculatorButtonItems: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    
    case divide = "/"
    case multiply = "*"
    case subtract = "-"
    case decimal = "."
    case add = "+"
    case equal = "="
    case clear = "C"
    
    var textColor: Color {
        switch self {
        case .clear : .red
        default: .white
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .divide, .multiply, .equal, .add, .subtract: .orange
            
        default: .gray
        }
    }
}

struct ContentView: View {
    @State private var displayText = "0"
    private let buttonTitles: [[CalculatorButtonItems]] = [[.seven, .eight, .nine, .divide],
                                                [.four, .five, .six, .multiply],
                                                [.one, .two, .three, .subtract],
                                                [.decimal, .zero, .clear, .add],
                                                [.equal]]
    @State private var beforeNum: String = ""
    @State private var afterNum: String = ""
    @State private var selectedOperation: CalculatorButtonItems?
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                Spacer()
                HStack {
                    Spacer()
                    
                    Text(displayText)
                        .font(.system(size: 60, weight: .bold))
                        .foregroundStyle(.white)
                        .padding()
                }
                
                
                
                ForEach(buttonTitles, id: \.self) { row in
                    HStack(spacing: 10) {
                        ForEach(row, id: \.self) { button in
                            CalculatorButton(button: button, displayText: $displayText, selectedOperation: $selectedOperation, beforeNum: $beforeNum, afterNum: $afterNum)
                        }
                    }
                }
            }
            .padding()
        }
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
