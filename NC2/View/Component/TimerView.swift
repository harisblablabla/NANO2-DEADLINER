//
//  TimerView.swift
//  NC2
//
//  Created by Haris Fadhilah on 28/07/22.
//

import SwiftUI

struct TimerView: View {
    
    @State var nowDate: Date = Date()
    let setDate: Date
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.nowDate = Date()
        }
    }
    
    var body: some View {
        Text(timerFunction(from: setDate))
            .onAppear(perform: {self.timer})
    }
    
    func timerFunction(from date: Date) -> String {
        let calendar = Calendar(identifier: .gregorian)
        let timeValue = calendar
            .dateComponents([.day, .hour, .minute, .second], from: nowDate, to: setDate)
        return String(format: "%02d days left - %02d:%02d:%02d",
                      timeValue.day!,timeValue.hour!, timeValue.minute!, timeValue.second!)
    }
    
}

//struct TimerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerView(setDate: toDate)
//    }
//}
