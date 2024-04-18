//
//  ContentView.swift
//  LAB7-Calculator
//
//  Created by Chung Wussup on 4/18/24.
//

import SwiftUI

enum ButtonText: String {
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
        default: .black
        }
    }
}


struct ContentView: View {
    @State var displayNum = "0"
    @State var resultNum = 0
    @State private var calculatorState = Calculator()
    
    private let buttonTitles: [[ButtonText]] = [[.seven, .eight, .nine, .divide],
                                                [.four, .five, .six, .multiply],
                                                [.one, .two, .three, .subtract],
                                                [.decimal, .zero, .clear, .add],
                                                [.equal]]
    
    var body: some View {
        
        VStack(spacing: 10) {
            Spacer()
            
            Text(displayNum)
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            ForEach(buttonTitles, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { button in
                        CalculatorButton(button: button, displayText: $displayNum, calculatorState: $calculatorState)
                    }
                }
            }
        }
        
    }
}





#Preview {
    ContentView()
}
