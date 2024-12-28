//
//  Tab3.swift
//  PomodoroFullApp
//
//  Created by Zhanel Amralina on 8/1/24.
//

import SwiftUI

struct Tab3: View {
    @State private var breakTime: Int = 5 // Break time in minutes
    @State private var timerValue: Int = 0
    @State private var isTimerRunning: Bool = false
    @State private var startTime: Date? = nil
    @State private var timer: Timer? = nil

    var body: some View {
        ZStack {
            Image("BG")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Replace with FocusCategoryButton if needed
                // FocusCategoryButton()
                 
                ZStack {
                    ProgressBarCustom(progress: CGFloat(timerValue) / CGFloat(breakTime * 60))
                        .padding(40)
                    VStack {
                        Text(formatTime(timerValue))
                            .foregroundColor(.white)
                            .font(.system(size: 46, weight: .bold))
                            .padding()
                        Text("Break")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                    }
                }
                
                HStack(spacing: 50) {
                    Button(action: startTimer) {
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                    }
                    Button(action: pauseTimer) {
                        Image(systemName: "pause.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                    }
                    Button(action: stopTimer) {
                        Image(systemName: "stop.fill")
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
            self.timerValue = max(0, breakTime * 60 - elapsedTime)
            
            if self.timerValue <= 0 {
                // Timer ended logic (could include switching to focus time or a different action)
                self.stopTimer() // Stop timer when break time ends
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
        timerValue = breakTime * 60 // Reset to full break time
    }
    
    private func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct Tab3_Previews: PreviewProvider {
    static var previews: some View {
        Tab3()
    }
}
