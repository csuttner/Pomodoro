//
//  ContentView.swift
//  Pomodoro WatchKit Extension
//
//  Created by Clay Suttner on 4/28/21.
//

import SwiftUI

struct ContentView: View {
    let workTime = 15
    let breakTime = 5
    
    @State var timerVal = 15
    @State var paused = true
    @State var working = true
    @State var started = false
    
    var body: some View {
        VStack {
            timerModeText
            Spacer()
            timerValText
            Spacer()
            buttonStack
        }
    }
    
    var timerModeText: some View {
        Text(working ? "Work" : "Break")
    }
    
    var timerValText: some View {
        Text(timerValString)
            .font(.system(size: 40))
            .foregroundColor(paused ? .gray : .white)
            .onAppear() {
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: timerAction(timer:))
            }
    }
    
    var timerValString: String {
        let minutes = timerVal / 60
        let seconds = timerVal % 60
        return seconds < 10 ? "\(minutes):0\(seconds)" : "\(minutes):\(seconds)"
    }

    var buttonStack: some View {
        HStack {
            Button(action: pauseAction, label: {
                if paused {
                    Text("Start")
                        .foregroundColor(.green)
                } else {
                    Text("Pause")
                        .foregroundColor(.yellow)
                }
            })
            Button(action: cancelAction, label: {
                Text("Cancel")
                    .foregroundColor(.red)
            })
        }
    }

    func timerAction(timer: Timer) {
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
    
    func pauseAction() {
        if !started {
            if working {
                timerVal = workTime
            } else {
                timerVal = breakTime
            }
            started = true
        }
        paused.toggle()
    }
    
    func cancelAction() {
        paused = true
        started = false
        working = true
        timerVal = workTime
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
