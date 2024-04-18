//
//  ContentView.swift
//  LAB7-Calculator
//
//  Created by Chung Wussup on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    @State private var totalNumber: String = "0"
    @State private var resultNumber: String = "0"
    var body: some View {
        VStack {
            Text(resultNumber)
                .frame(alignment: .trailing)
                .font(.system(size: 60))
                .foregroundColor(.black)
                .padding()
            
            HStack {
                
                Spacer()
                Text(totalNumber)
                    .font(.system(size: 60))
                    .foregroundColor(.black)
                    .padding()
            }
            HStack {
                Button {
                    
                } label: {
                    Text("C")
                        .frame(width: 80, height: 80)
                        .background(.black)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
                Button {
                    
                }label: {
                    Text("+/-")
                        .frame(width: 80, height: 80)
                        .background(.black)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
                Button {
                    
                }label: {
                    Text("%")
                        .frame(width: 80, height: 80)
                        .background(.black)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
                Button {
                    
                }label: {
                    Text("/")
                        .frame(width: 80, height: 80)
                        .background(.yellow)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
            }
            HStack {
                Button {
                    totalNumber = "7"
                } label: {
                    Text("7")
                        .frame(width: 80, height: 80)
                        .background(.gray)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
                Button {
                    totalNumber = "8"
                } label: {
                    Text("8")
                        .frame(width: 80, height: 80)
                        .background(.gray)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
                Button{
                    totalNumber = "9"
                } label: {
                    Text("9")
                        .frame(width: 80, height: 80)
                        .background(.gray)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
                Button {
                    
                }label: {
                    Text("+")
                        .frame(width: 80, height: 80)
                        .background(.yellow)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
            }
            HStack {
                Button {
                    totalNumber = "4"
                } label: {
                    Text("4")
                        .frame(width: 80, height: 80)
                        .background(.gray)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
                Button {
                    totalNumber = "5"
                } label: {
                    Text("5")
                        .frame(width: 80, height: 80)
                        .background(.gray)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
                Button {
                    totalNumber = "6"
                } label: {
                    Text("6")
                        .frame(width: 80, height: 80)
                        .background(.gray)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
                Button {
                    
                } label: {
                    Text("-")
                        .frame(width: 80, height: 80)
                        .background(.yellow)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
            }
            HStack {
                Button {
                    totalNumber = "1"
                } label: {
                    Text("1")
                        .frame(width: 80, height: 80)
                        .background(.gray)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
                Button {
                    totalNumber = "2"
                } label: {
                    Text("2")
                        .frame(width: 80, height: 80)
                        .background(.gray)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
                Button {
                    totalNumber = "3"
                } label: {
                    Text("3")
                        .frame(width: 80, height: 80)
                        .background(.gray)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
                Button {
                    
                } label: {
                    Text("+")
                        .frame(width: 80, height: 80)
                        .background(.yellow)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
            }
            HStack {
                Button {
                    totalNumber = "0"
                } label: {
                    Text("     0")
                        .frame(width: 170, height: 80 ,alignment:.leading)
                        .background(.gray)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
                Button {
                    
                } label: {
                    Text(".")
                        .frame(width: 80, height: 80)
                        .background(.gray)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
                Button {
                    
                }label: {
                    Text("=")
                        .frame(width: 80, height: 80)
                        .background(.yellow)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.system(size: 33))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
