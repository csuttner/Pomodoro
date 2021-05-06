//
//  ContentView.swift
//  Pomodoro WatchKit Extension
//
//  Created by Clay Suttner on 4/28/21.
//

import SwiftUI

struct ContentView: View {
    @State var timerVal = 15
    @State var paused = true
    @State var working = false
    @State var started = false
    
    var timerValString: String {
        let minutes = timerVal / 60
        let seconds = timerVal % 60
        return seconds < 10 ? "\(minutes):0\(seconds)" : "\(minutes):\(seconds)"
    }
    
    var timerModeString: String {
        return working ? "Break" : "Work"
    }
    
    var body: some View {
        VStack {
            Text(timerModeString)
            Spacer()
            Text(timerValString)
                .font(.system(size: 40))
                .foregroundColor(paused ? .gray : .white)
                .onAppear() {
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                        if !paused {
                            if timerVal > 0 {
                                timerVal -= 1
                            } else {
                                paused = true
                                working.toggle()
                                started.toggle()
                            }
                        }
                    }
                }
            Spacer()
            HStack {
                Button(action: {
                    if !started {
                        if working {
                            timerVal = 5
                        } else {
                            timerVal = 15
                        }
                        started = true
                    }
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
                    started = false
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
