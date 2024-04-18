//
//  CalculatorButton.swift
//  LAB7-Calculator
//
//  Created by Chung Wussup on 4/18/24.
//

import SwiftUI

struct CalculatorButton: View {
    let button: ButtonText
    @Binding var displayText: String
    
    var body: some View {
        Button(action: {
        }) {
            Text(button.rawValue)
                .font(.title)
                .frame(width: 80, height: 80)
                .foregroundColor(button.textColor)
                .border(.black)
        }

    }
    
    
}
