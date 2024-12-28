//
//  Tab2.swift
//  PomodoroFullApp
//
//  Created by Zhanel Amralina on 8/1/24.
//

import SwiftUI

struct Tab2: View {
    @State private var focusTime: Int = 25
    @State private var breakTime: Int = 5
    @State private var timerValue: Int = 0
    @State private var isTimerRunning: Bool = false
    @State private var isFocusTime: Bool = true
    @State private var startTime: Date? = nil
    @State private var timer: Timer? = nil

    var body: some View {
        ZStack {
            Image("BG")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    Text(formatTime(timerValue))
                        .foregroundColor(.white)
                        .font(.system(size: 46, weight: .bold))
                        .padding()
                    
                    Text(isFocusTime ? "Focus on your task" : "Take a break")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                }
                .padding()
                
                ProgressBarCustom(progress: CGFloat(timerValue) / CGFloat((isFocusTime ? focusTime : breakTime) * 60))
                    .padding(40)
                
                HStack(spacing: 50) {
                    Button(action: startTimer) {
                        Image("Play")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                    }
                    Button(action: pauseTimer) {
                        Image("Pause")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                    }
                    Button(action: stopTimer) {
                        Image("Stop")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                    }
                }
                .padding()
            }
        }
    }
    
    private func startTimer() {
        if isTimerRunning { return }
        
        isTimerRunning = true
        startTime = Date()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            guard let startTime = self.startTime else { return }
            let elapsedTime = Int(Date().timeIntervalSince(startTime))
            self.timerValue = max(0, (self.isFocusTime ? self.focusTime : self.breakTime) * 60 - elapsedTime)
            
            if self.timerValue <= 0 {
                self.isFocusTime.toggle()
                self.timerValue = self.isFocusTime ? self.focusTime * 60 : self.breakTime * 60
                self.startTime = Date() // This assignment should now work
            }
        }
    }
    
    private func pauseTimer() {
        timer?.invalidate()
        isTimerRunning = false
    }
    
    private func stopTimer() {
        timer?.invalidate()
        isTimerRunning = false
        timerValue = isFocusTime ? focusTime * 60 : breakTime * 60
    }
    
    private func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct Tab2_Previews: PreviewProvider {
    static var previews: some View {
        Tab2()
    }
}

