//
//  ContentView.swift
//  SwiftUI Fun
//
//  Created by Satoshi Shimamura Second on 2021/02/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
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
                NavigationLink(
                    destination: NickDetailView(),
                    label: {
                        Text("Go to Deatail")
                    })
            }.navigationBarTitle("Hello World")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
