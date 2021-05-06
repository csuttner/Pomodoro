//
//  ContentView.swift
//  Pomodoro WatchKit Extension
//
//  Created by Clay Suttner on 4/28/21.
//

import SwiftUI

struct ContentView: View {
    @State var timerVal = 5 * 60
    @State var paused = true
    
    var timerValString: String {
        let minutes = timerVal / 60
        let seconds = timerVal % 60
        return seconds < 10 ? "\(minutes):0\(seconds)" : "\(minutes):\(seconds)"
    }
    
    var body: some View {
        VStack {
            Text(timerValString)
                .font(.system(size: 40))
                .onAppear() {
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                        if self.timerVal > 0 {
                            self.timerVal -= 1
                        }
                    }
                }
            HStack {
                Button(action: {
                    //
                }, label: {
                    Text(paused ? "Start" : "Pause")
                })
                Button(action: {
                    //
                }, label: {
                    Text("Cancel")
                })
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
