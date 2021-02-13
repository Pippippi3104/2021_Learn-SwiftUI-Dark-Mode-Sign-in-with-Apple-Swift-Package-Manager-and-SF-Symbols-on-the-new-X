//
//  ContentView.swift
//  SwiftUI Fun
//
//  Created by Satoshi Shimamura Second on 2021/02/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .foregroundColor(.red)
                .fontWeight(.heavy)
            Spacer()
            Text("I love swiftUI")
            Spacer()
            Text("I like eggs")
                .foregroundColor(.white)
                .background(Color.green)
            Circle().foregroundColor(.orange)
            Rectangle()
            Image(systemName: "trash").resizable()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
