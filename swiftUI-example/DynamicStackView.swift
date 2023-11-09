//
//  DynamicStackView.swift
//  swiftUI-example
//
//  Created by 서수영 on 2023/11/09.
//

//설계단계에서 HStack인지 VStack인지 마지막에 결정해야 한다
import SwiftUI

struct DynamicStackView: View {

    @State var myLayout: AnyLayout = AnyLayout(VStackLayout())

    var body: some View {
        VStack {
            myLayout {
                Image(systemName: "goforward.10")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "goforward.15")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }

            HStack {
                Button(action: {
                    myLayout = AnyLayout(HStackLayout()) }){
                    Text("HStack")
                }
                Button(action: {
                    myLayout = AnyLayout(VStackLayout()) }){
                    Text("VStack")
                }
            }
        }
    }
}

struct DynamicStackView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicStackView()
    }
}

