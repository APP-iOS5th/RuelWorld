//
//  ContentView.swift
//  Calculator
//
//  Created by 황규상 on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Calaulator")
                .font(.largeTitle)
                .foregroundStyle(Color.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    ContentView()
}
