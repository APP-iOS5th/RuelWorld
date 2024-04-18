//
//  ContentView.swift
//  Calculator
//
//  Created by 황규상 on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    let buttons: [[String]] = [
        ["7", "8", "9", "/"],
        ["4", "5", "6", "*"],
        ["1", "2", "3", "-"],
        [".", "0", "C", "+"],
        ["="]
        
    ]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("0")
                    .font(.system(size: 72))
            }
            .padding()
            
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { buttonLabel in
                        Button(action: {
                           
                            print("\(buttonLabel) was tapped")
                        }) {
                            Text(buttonLabel)
                                .font(.system(size: 32))
                                .frame(width: buttonLabel == "=" ? 340 : 80, height: buttonLabel == "=" ? 80 : 80)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(40)
                            
                        }
                    }
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .foregroundColor(Color.white)
    }
}

#Preview {
    ContentView()
}
