//
//  BindingAndForEachView.swift
//  swiftUI-example
//
//  Created by 서수영 on 2023/11/09.
//

import SwiftUI

struct BindingAndForEachView: View {

    @State private var rotationDegree: Double = 0
    @State private var text = "Hello world!"

    private let colors: [Color] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple, .black]
    private let colorNames: [String] = ["red", "orange", "yellow", "green", "cyan", "blue", "purple", "black"]
    @State private var colorIndex = 0


    var body: some View {
        VStack {
            Text(text)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
                .rotationEffect(.degrees(rotationDegree))
                .foregroundColor(colors[colorIndex])

            Divider()

            Slider(value: $rotationDegree, in: 0...360, step: 0.1)
                .padding()

            //바인딩 하면 초기값이 표시된다? (기본값이 표시되고 변경될때 바뀌는줄)
            TextField("Enter text here", text: $text)
                .textFieldStyle(.roundedBorder)
            //RoundedBorderFieldStyle과 차이?
                .padding()

            Picker(selection: $colorIndex, label: Text("Color")) {
                ForEach(0..<colors.count) {
                    Text(colorNames[$0])
                        .foregroundColor(colors[$0])
                }
            }.pickerStyle(.wheel)

        }

    }
}

struct BindingAndForEachView_Previews: PreviewProvider {
    static var previews: some View {
        BindingAndForEachView()
    }
}

