//
//  TimerManager.swift
//  PomodoroFullApp
//
//  Created by Zhanel Amralina on 8/1/24.
//

import SwiftUI
import Combine

class TimerManager: ObservableObject {
    @Published var focusTime: Int = 25 // in minutes
    @Published var breakTime: Int = 5 // in minutes
    @Published var timerValue: Int = 0
    @Published var isTimerRunning: Bool = false
    @Published var isFocusTime: Bool = true
    
    private var startTime: Date? = nil
    private var timer: Timer? = nil
    
    func startTimer() {
        if isTimerRunning { return }
        
        isTimerRunning = true
        startTime = Date()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self, let startTime = self.startTime else { return }
            let elapsedTime = Int(Date().timeIntervalSince(startTime))
            self.timerValue = max(0, (self.isFocusTime ? self.focusTime : self.breakTime) * 60 - elapsedTime)
            
            if self.timerValue <= 0 {
                self.isFocusTime.toggle()
                self.timerValue = self.isFocusTime ? self.focusTime * 60 : self.breakTime * 60
                self.startTime = Date()
            }
        }
    }
    
    func pauseTimer() {
        timer?.invalidate()
        isTimerRunning = false
    }
    
    func stopTimer() {
        timer?.invalidate()
        isTimerRunning = false
        timerValue = isFocusTime ? focusTime * 60 : breakTime * 60
    }
    
    func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
