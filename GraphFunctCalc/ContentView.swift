//
//  ContentView.swift
//  GraphFunctCalc
//
//  Created by Student on 11/4/22.
//

import SwiftUI
struct blankView: View {
    var body: some View {
        NavigationView(){
            ZStack() {
                Color.gray
            }
        }
    }
}
struct ContentView: View {
    var body: some View {
        TabView {
                BasicCalc()
                    .tabItem() {
                        Text("Basic Calc")
                    }
                BasicGraph()
                    .tabItem() {
                        Text("Graph View")
                    }
               /* Function()
                    .tabItem() {
                        Text("Functions")
                    }*/
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
