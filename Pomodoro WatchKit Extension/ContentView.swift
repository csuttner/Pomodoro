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
            Spacer()
            Text(timerValString)
                .font(.system(size: 40))
                .foregroundColor(paused ? .gray : .white)
                .onAppear() {
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                        if !self.paused {
                            if self.timerVal > 0 {
                                self.timerVal -= 1
                            }
                        }
                    }
                }
            Spacer()
            HStack {
                Button(action: {
                    paused.toggle()
                }, label: {
                    if paused {
                        Text("Start")
                            .foregroundColor(.green)
                    } else {
                        Text("Pause")
                            .foregroundColor(.yellow)
                    }
                })
                Button(action: {
                    //
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.red)
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
