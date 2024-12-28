//
//  History.swift
//  PomodoroFullApp
//
//  Created by Zhanel Amralina on 8/1/24.
//

import SwiftUI

struct History: View {
    @State private var history: [String: (focusTime: Int, breakTime: Int)] = [:]
    
    var body: some View {
        List {
            ForEach(history.keys.sorted(), id: \.self) { date in
                HStack {
                    Text(date)
                    Spacer()
                    Text("Focus: \(history[date]?.focusTime ?? 0) mins")
                    Text("Break: \(history[date]?.breakTime ?? 0) mins")
                }
            }
        }
    }
}
