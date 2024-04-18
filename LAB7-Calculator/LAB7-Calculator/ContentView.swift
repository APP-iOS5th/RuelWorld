import SwiftUI

struct ContentView: View {
    @State var print: String = ""
    @State var input: [String] = []
    let arr: [[String]] = [["7", "8", "9", "/"], ["4", "5", "6", "*"], ["1", "2", "3", "-"],[".", "0", "C", "+"], ["="]]
    
    var body: some View {
        VStack {
            TextField("0", text: $print)
                .multilineTextAlignment(.trailing)
                .frame(width: .infinity, height: 150, alignment: .trailing)
                .font(.largeTitle)
                .padding()
            
            
            ForEach(arr, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { buttonLabel in
                        Button(action: {
                            ClickButton(buttonLabel)
                        }) {
                            Text(buttonLabel)
                                .font(.title)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
    func ClickButton(_ label: String) {
        if label == "=" {
            input.append(print)
            print = ""
            Swift.print(input)
        } else if label == "C" {
            print = ""
        } else if label == "+" {
            input.append(print)
            input.append("+")
            print = ""
        } else if label == "-" {
            input.append(print)
            input.append("-")
            print = ""
        } else if label == "*" {
            input.append(print)
            input.append("*")
            print = ""
        } else if label == "/" {
            input.append(print)
            input.append("/")
            print = ""
        } else {
            print += label
        }
    }
}

#Preview {
    ContentView()
}

