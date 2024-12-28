//
//  Settings.swift
//  PomodoroFullApp
//
//  Created by Zhanel Amralina on 8/1/24.
//

import SwiftUI

struct Settings: View {
    @State private var focusTime: Int = 25
    @State private var breakTime: Int = 5
    
    var body: some View {
        Form {
            Section(header: Text("Focus Time")) {
                Stepper("\(focusTime) minutes", value: $focusTime, in: 1...60)
            }
            Section(header: Text("Break Time")) {
                Stepper("\(breakTime) minutes", value: $breakTime, in: 1...60)
            }
        }
        .padding()
    }
}
