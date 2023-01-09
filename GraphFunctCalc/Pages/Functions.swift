//
//  Functions.swift
//  GraphFunctCalc
//
//  Created by Student on 11/4/22.
//

import SwiftUI
/*visually display list of functions, need button to create new functions*/
/*struct should have input and output variables, only output needed for graphs*/
/*also want button to let you call basicgraph view on a function*/
/*need to be able to use all buttons from basic calc page here too*/
/*don't parse text to values and operations, just use buttons from basic calc instead*/
/*we can write out full function as different operations back to back rather than all at once*/
/*need parentheses to declare which steps happen first*/
struct Function {
    var funct = String()
    var output = Double()
    var input = Double()
}
var FunctionList = [Function]()
/*PEMDAS implementation*/
/*converting string to math operations then doing them*/
/*https://stackoverflow.com/questions/54463146/how-to-execute-multiplications-and-or-divisions-in-the-right-order as base*/
/*https://en.wikipedia.org/wiki/Shunting_yard_algorithm*/
/*stack of nums and operations, use shunting yard algorithm*/
/*convert function into reverse polish notation*/
enum Token: CustomStringConvertible {
    var description: String
    {
        switch self
        { /*either return number or do operation*/
        /*5 cases, number, function, operator, (, and )*/
        /*function meaning sin, powers, etc.*/
        case .number(let num):
            return "\(num)"
        case .op(let symbol):
            return "\(symbol)"
        case .fun(let funct):
            return "\(funct)"
        case .lp:
            return "("
        case .rp:
            return ")"
        }
    }
    case op(String)
    case number(Int)
    case fun(String)
    case lp(String)
    case rp(String)
    /*give values to signify priority
     operations as stack and nums in output queue*/
    var precedence: Int {
        switch self{
        case .op(let symbol):
            return Token.pris[symbol] ?? -1
        default:
            return -1
        }
    }
    /*operation stack definitions*/
    var operation: (inout Stack<Int>) -> () {
        switch self {
        case .op(let symbol):
            return Token.ops[symbol]!
        case .number(let val):
            return {$0.push(val)}
        }
    }
        var operation: (inout Stack<String>) -> () {
            switch self{
            case .fun(let funct):
                return {$0.push(funct)}
        case .lp(let leftpar):
                return {$0.push("(")}
        case .rp(let rightpar):
                return {$0.push(")")}
        }
    }
    /*priorities and vals here*/
    static let pris = [ "+" : 1, "-": 1, "*" : 2, "/" : 2, "^" : 3]
    /*operations defined here*/
    static let ops: [String : (inout Stack<Int>) -> ()] =
    [
        "+" : {$0.push($0.pop() + $0.pop())},
        "-" :{$0.push($0.pop() - $0.pop())},
        "*" :{$0.push($0.pop() * $0.pop())},
        "/" :{$0.push($0.pop() / $0.pop())},
        "^" :{$0.push($0.pop() + $0.pop())}
    ]
}
/*implementing basic stack with peek, pop, & push*/
struct Stack<T> {
    var vals: [T] = []
    var empty: Bool {return vals.isEmpty}
    mutating func push(_ n: T){
        vals.append(n)
    }
    mutating func pop() -> T{
        return vals.removeLast()
    }
    func peek() -> T {
        return vals.last!
    }
}
/*shunting yard is algorithm for arithmetic*/
func syAlg(inp: [Token]) -> [Token] {
    var opStack = Stack<Token>()
    var out: [Token] = []
    for token in inp {
        switch token {
        case .number:
            out.append(token)
        case .op: /*while top of stack exists & isn't (, */
            while ((!opStack.empty) && (opStack.peek().precedence >= token.precedence)) {
                out.append(opStack.pop())
            }
            opStack.push(token)
        case .fun: /* ^, sincostan, len, log, single calculations*/
            opStack.push(token)
        case .lp:
            opStack.push(token)
        case .rp:
            while(opStack.peek() != "("){
                assert(!opStack.empty, "missing starting parentheses")
                out.append(opStack.pop())
            }
            
            if (opStack.peek() == Function){
                out.append(opStack.pop())
            }
        }

    }
    while (!opStack.vals.isEmpty) {
        out.append(opStack.pop())
    }
    return out
}
/*have a button on screen to add a function to the list*/
/*when that button is tapped, pull up the buttons from basic calc and allow for simple writing*/
/*no math execution yet, just a big ass string*/
