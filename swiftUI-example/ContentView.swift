//
//  ContentView.swift
//  swiftUI-example
//
//  Created by 서수영 on 2023/11/05.
//

import SwiftUI

struct ContentView: View {
    var mystack: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .font(Font.largeTitle)
        }
    }
    var body: some View {
        HStack {
            mystack
                .padding()
            mystack
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
