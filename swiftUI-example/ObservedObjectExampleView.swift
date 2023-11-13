//
//  ObservedObjectExampleView.swift
//  swiftUI-example
//
//  Created by 서수영 on 2023/11/13.
//

import SwiftUI
import Combine

class TimerData: ObservableObject {

    @Published var timeCount = 0
    var timer: Timer?

    init() {
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(timerDidFire),
                                     userInfo: nil,
                                     repeats: true)
    }

    @objc func timerDidFire() {
        timeCount += 1
    }

    func resetCount() {
        timeCount = 0
    }
}

struct ObservedObjectExampleView: View {

    @StateObject var timerData: TimerData = TimerData()

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SecondView()) {
                    Text("Next Screen")
                }.padding()
                Button(action: resetCount) {
                    Text("Reset")
                }
            }
        }.environmentObject(timerData)
    }

    func resetCount() {
        timerData.resetCount()
    }
}

struct SecondView: View {

    @EnvironmentObject var timerData: TimerData

    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
                .font(.headline)
        }.padding()
    }
}

struct ObservedObjectExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectExampleView()
    }
}
