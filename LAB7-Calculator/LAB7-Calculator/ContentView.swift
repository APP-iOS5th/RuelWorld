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

struct Calculator {
    var currentNumber: Double = 0
    var number: Double?
    var currentOperation: ButtonText?
    
    var beforeNum: Double = 0
}

struct CalculatorButton: View {
    let button: ButtonText
    @Binding var displayText: String
    @Binding var calculatorState: Calculator
    
    var body: some View {
        Button(action: {
            self.buttonTapped()
        }) {
            Text(button.rawValue)
                .font(.title)
                .frame(width: 80, height: 80)
                .foregroundColor(button.textColor)
                .border(.black)
        }
        
    }
    
    private func buttonTapped() {
        switch button {
        case .clear:
            clear()
        case .equal:
            caculResult()
        case .add, .divide, .subtract, .multiply :
            calculOperate(button: button)
        default:
            addNum(num: button)
        }
    }
    
    private func clear() {
        displayText = "0"
        calculatorState = Calculator()
    }
    
    private func caculResult() {
        guard let number = calculatorState.number else { return }
        guard let currentNumber = Double(displayText) else { return }
        var result: Double
        
        switch calculatorState.currentOperation {
        case .add:
            result = number + currentNumber
        case .subtract:
            result = number - currentNumber
        case .multiply?:
            result = number * currentNumber
        case .divide?:
            result = number / currentNumber
        default:
            return
        }
        
        displayText = String(result)
        calculatorState = Calculator(currentNumber: result, number: nil, currentOperation: nil)
        
    }
    
    
    private func calculOperate(button: ButtonText) {
        let number = String(displayText)
        calculatorState.number = Double(number)
        switch button {
        case .add :
            calculatorState.currentOperation = .add
            displayText = ""
        case .subtract:
            calculatorState.currentOperation = .subtract
            displayText = ""
        case .multiply :
            calculatorState.currentOperation = .multiply
            displayText = ""
        case .divide:
            calculatorState.currentOperation = .divide
            displayText = ""
        default:
            displayText += number
        }
        
        
    }
    
    func addNum(num: ButtonText) {
        if displayText == "0" && num != .decimal {
            if displayText == "0" {
                displayText = num.rawValue
            } else {
                displayText += num.rawValue
            }
        } else {
            if displayText != "0" {
                displayText.append(num.rawValue)
            }else {
                displayText = num.rawValue
            }
        }
    }
}




#Preview {
    ContentView()
}
