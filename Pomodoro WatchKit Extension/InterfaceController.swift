//
//  InterfaceController.swift
//  Pomodoro WatchKit Extension
//
//  Created by Clay Suttner on 4/25/21.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    @IBOutlet var button: WKInterfaceButton!
    @IBOutlet var timer: WKInterfaceTimer!
    
    var paused: Bool = true
    
    override func awake(withContext context: Any?) {
        
    }
    
    @IBAction func onButtonTapped() {
        if paused {
            timer.start()
            timer.setTextColor(.cyan)
            button.setTitle("Pause")
        } else {
            timer.stop()
            timer.setTextColor(.darkGray)
            button.setTitle("Start")
        }
        
        paused.toggle()
    }
}
