//
//  CalculatorButton.swift
//  LAB7-Calculator
//
//  Created by Chung Wussup on 4/18/24.
//

import SwiftUI


struct CalculatorButton: View {
    let button: CalculatorButtonItems
    @Binding var displayText: String
    @Binding var selectedOperation: CalculatorButtonItems?
    
    @Binding var beforeNum: String
    @Binding var afterNum: String
    
    var body: some View {
        Button(action: {
            buttonTapped()
        }) {
            Text(button.rawValue)
                .font(.title)
                .foregroundColor(button.textColor)
                .frame(maxWidth: .infinity, maxHeight: 80)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 80)
        .background(button.backgroundColor)
        .cornerRadius(40)
        
    }
    
    func buttonTapped() {
        switch button {
        case .divide, .multiply, .subtract, .add:
            
            selectedOperation = button
            beforeNum = afterNum
            afterNum = ""
            displayText = beforeNum
            
        case .equal:
            calculateResult()
        case .clear:
            beforeNum = ""
            afterNum = ""
            displayText = "0"
        default :
            numberTapped(number: button.rawValue)
        }
    }
    
    func numberTapped(number: String) {
        
        afterNum += number
        displayText = afterNum
    }
    
    func calculateResult() {
        guard let operation = selectedOperation else { return }
        guard let num1 = Double(beforeNum), let num2 = Double(afterNum) else { return }
        
        var result: Double = 0.0
        switch operation {
        case .add:
            result = num1 + num2
        case .subtract:
            result = num1 - num2
        case .multiply:
            result = num1 * num2
        case .divide:
            if num2 != 0 {
                result = num1 / num2
            } else {
                displayText = "Error"
                return
            }
        default:
            break
        }
        
        displayText = String(result)
        beforeNum = ""
        afterNum = ""
        selectedOperation = nil
    }
    
    
    
}
