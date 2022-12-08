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
    var out = Int()
}
var FunctionList = [Function]()
