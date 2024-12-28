//
//  MainTab1View.swift
//  PomodoroFullApp
//
//  Created by Zhanel Amralina on 8/1/24.
//

import SwiftUI

struct MainTab1View: View {
    @StateObject private var timerManager = TimerManager()
    
    var body: some View {
        VStack {
            Text(timerManager.formatTime(timerManager.timerValue))
                .font(.largeTitle)
                .padding()
            
            HStack {
                Button(action: timerManager.startTimer) {
                    Text("Start")
                }
                Button(action: timerManager.pauseTimer) {
                    Text("Pause")
                }
                Button(action: timerManager.stopTimer) {
                    Text("Stop")
                }
            }
            .padding()
        }
        .onAppear {
            // Load saved settings or initialize
            timerManager.timerValue = timerManager.focusTime * 60
        }
    }
}

struct MainTab1View_Previews: PreviewProvider {
    static var previews: some View {
        MainTab1View()
    }
}
