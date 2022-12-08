//
//  GraphSettings.swift
//  GraphFunctCalc
//
//  Created by Student on 11/4/22.
//

/*settings for graphs should include how much you see, where on graph you see
 which functions are getting graphed if any, and whatever else a graph has on a graphing calc*/
import Foundation
/*what function, what inputs*/
var curFunc = Function()
var points: [Int] = []
/*how spread out are the graphed points?*/
var inscale = Int()
/*choose edges of where we see in graph
 start and end of x / y plane*/
var Xblow = Int()
var Xbhi = Int()
var Yblow = Int()
var Ybhi = Int()
