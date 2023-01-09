//
//  BasicCalc.swift
//  GraphFunctCalc
//
//  Created by Student on 11/4/22.
//

import SwiftUI
import Foundation

struct BasicCalc_Previews: PreviewProvider {
    static var previews: some View {
        BasicCalc()
    }
}

enum CalcButton: String {
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
    case add = "+"
    case sub = "-"
    case div = "/"
    case mult = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case neg = "-/+"
    case vari = "var"
    case sec = "2nd"
    case opar = "("
    case epar = ")"
    case ln = "ln"
    case log = "log"
    case sin = "sin"
    case cos = "cos"
    case tan = "tan"
    case exp = "^"
    var buttonColor: Color {
        switch self {
        case .add, .sub, .mult, .div, .equal:
            return .orange
        case .clear, .neg, .percent:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}
enum Operation {
    case add, sub, mult, div, sin, cos, tan, log, ln, exp, none
}

struct BasicCalc: View {
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    @State var cFunc = ""
    @State var second = false
    let buttons: [[CalcButton]] = [
        [.sin, .cos, .tan, .sec],
        [.opar, .epar, .ln, .log],
        [.clear, .neg, .percent, .div],
        [.seven, .eight, .nine, .mult],
        [.four, .five, .six, .sub],
        [.one, .two, .three, .add],
        [.zero, .exp, .decimal, .equal],
    ]

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()

                // Text display
                HStack {
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                .padding()
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight()
                                    )
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
    func didTap(button: CalcButton) {
        switch button {
        case .sec, .add, .sub, .mult, .div, .sin, .cos, .tan, .ln, .log, .equal:
            if button == .sec {
                self.second = true
            }
            else if button == .add {
                self.currentOperation = .add
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .sub {
                self.currentOperation = .sub
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .mult {
                self.currentOperation = .mult
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .div {
                self.currentOperation = .div
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .sin {
                self.currentOperation = .sin
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .cos {
                self.currentOperation = .cos
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .tan {
                self.currentOperation = .tan
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .ln {
                self.currentOperation = .ln
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .log {
                self.currentOperation = .log
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .exp {
                self.currentOperation = .exp
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation {
                case .add: self.value = "\(runningValue + currentValue)"
                case .sub: self.value = "\(runningValue - currentValue)"
                case .mult: self.value = "\(runningValue * currentValue)"
                case .div: self.value = "\(runningValue / currentValue)"
                case .sin: if (self.second == false) {
                    self.value = "\(sin(Double (currentValue)))"
                }
                    else {
                        self.value = "\(sinh(Double (currentValue)))"
                    }
                case .cos: if (self.second == false) {
                    self.value = "\(cos(Double (runningValue)))"
                }
                    else {
                        self.value = "\(cosh(Double (runningValue)))"
                    }
                case .tan: if (self.second == false) {
                    self.value = "\(tan(Double (runningValue)))"
                }
                    else {
                        self.value = "\(tanh(Double (runningValue)))"
                    }
                case .ln: self.value = "\(log(Double (runningValue)))"
                case .log: self.value = "\(log(Double(runningValue)) / (log(Double (currentValue))))"
                case .exp: if (self.second == false) {
                    self.value = "\(pow(Double (currentValue), Double (runningValue)))"
                }
                    else {
                        self.value = "\(pow(Double(runningValue), Double(1/currentValue)))"
                    }
                case .none:
                    break
                }
            }
            if button != .equal {
                self.value = "0"
            }
        case .clear:
            self.value = "0"
        case .decimal, .neg, .percent:
            break
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
        func buttonWidth(item: CalcButton) -> CGFloat {
            return ((UIScreen.main.bounds.width) - (7*12))/6
        }
        func buttonHeight() -> CGFloat {
            return ((UIScreen.main.bounds.width) - (7*12))/6
        }
    }
