import SwiftUI

struct ContentView: View {
    @State private var print: String = ""
    @State private var input: String = ""
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
        switch label {
        case "=":
            input += label
            Cal()
        case "C":
            print = "0"
            input.removeAll()
        case "+", "-", "*", "/":
            if input.last != "+" && input.last != "-" && input.last != "*" && input.last != "/" {
                input += label
                input += print
                print = "0"
            }
        default:
            if print == "0" && label != "." {
                print = label
            } else if label != "." || !print.contains(".") {
                print += label
            }
            
        }
    }
    
    func Cal() {
        let mathExpression = NSExpression(format: input)
        print = mathExpression.expressionValue(with: nil, context: nil) as! String
    }
    
}

#Preview {
    ContentView()
}
