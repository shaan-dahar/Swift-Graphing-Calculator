//
//  BasicGraph.swift
//  GraphFunctCalc
//
//  Created by Student on 11/4/22.
//
/*look at swift charts, only want to use line on xy graph for now
 use linemark graphs from charts
 use graph settings to decide what bounds to graph in, and how spread out each input point should be
 # of x vals decide # of y vals
 top half of screen is graph itself
 bottom half of screen is list of buttons per function
 */
import SwiftUI
import Charts

struct fPoint {
    var inp: Double
    var oup: Double
}
func plot(/*function and input*/) {
    /*decided by range in graph settings*/
    /*while (between x bounds) {
     graphpoints.append(x,y)*/
    
}
struct BasicGraph: View {
    var body: some View {
        /*chart*/
        Chart{ /*outer loop for all funcs, inner loop for single lines*/
            /*ForEach(FUNCTIONLIST, id: \.name) {series in*/
                /*ForEach(series.fPoint) {item in
                    LineMark(
                    x: .value("x", item.inp),
                    y: .value("y", item.oup)
                    )
                 }
             }*/
        }
        /*create new button in grid
            onTap(plot it out)*/
        
    }
}

struct BasicGraph_Previews: PreviewProvider {
    static var previews: some View {
        BasicGraph()
    }
}
