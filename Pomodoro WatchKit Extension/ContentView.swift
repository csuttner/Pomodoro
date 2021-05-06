//
//  ContentView.swift
//  Pomodoro WatchKit Extension
//
//  Created by Clay Suttner on 4/28/21.
//

import SwiftUI

struct ContentView: View {
    @State var timerVal = 5
    @State var paused = true
    
    var body: some View {
        VStack {
            Text("\(timerVal)")
                .font(.system(size: 40))
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
