//
//  ContentView.swift
//  LAB7-Calculator
//
//  Created by Chung Wussup on 4/18/24.
//

import SwiftUI

struct NumberButtonView: View {
    let number: Int
    var body: some View {
        Button(number) {
            { print(number) }
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! youngwoo")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
