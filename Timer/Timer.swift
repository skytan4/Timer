//
//  Timer.swift
//  Timer
//
//  Updated by Taylor Mott on 10/16/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class Timer: NSObject {
    
    static let kTimerSecondTickNotification = "kTimerSecondTickNotification"
    static let kTimerCompleteNotification = "kTimerCompleteNotification"
    
    private(set) var seconds = NSTimeInterval(0)
    private var timer: NSTimer?
    var isOn: Bool {
        get {
            if timer == nil {
                return false
            } else {
                return true
            }
        }
    }
    
    func setTime(seconds: NSTimeInterval) {
        self.seconds = seconds
    }
    
    func startTimer() {
        if (timer == nil) {
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "secondTick", userInfo: nil, repeats: true)
        }
    }
    
    func stopTimer() {
        if let timer = timer {
            timer.invalidate()
            self.timer = nil
        }
    }
    
    func secondTick() {
        if timer != nil {
            seconds--;
            NSNotificationCenter.defaultCenter().postNotificationName(Timer.kTimerSecondTickNotification, object: self)
            if seconds <= 0 {
                NSNotificationCenter.defaultCenter().postNotificationName(Timer.kTimerCompleteNotification, object: self)
                stopTimer()
            }
        }
    }
    
    func timerString() -> String {
        
        let totalSeconds = Int(self.seconds)
        
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds - (hours * 3600)) / 60
        let seconds = totalSeconds - (hours * 3600) - (minutes * 60)
        
        var hoursString = ""
        if hours > 0 {
            hoursString = "\(hours):"
        }
        
        var minutesString = ""
        if minutes < 10 {
            minutesString = "0\(minutes):"
        } else {
            minutesString = "\(minutes):"
        }
        
        var secondsString = ""
        if seconds < 10 {
            secondsString = "0\(seconds)"
        } else {
            secondsString = "\(seconds)"
        }
        
        return hoursString + minutesString + secondsString
    }
}
