//
//  ProgressBarCustom.swift
//  PomodoroFullApp
//
//  Created by Zhanel Amralina on 8/1/24.
//

import SwiftUI

struct ProgressBarCustom: View {
    var progress: CGFloat // Value should be between 0 and 1
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 10)
                    .foregroundColor(Color.gray.opacity(0.5))
                Rectangle()
                    .frame(width: min(CGFloat(self.progress) * geometry.size.width, geometry.size.width), height: 10)
                    .foregroundColor(.green)
                    .animation(.linear)
            }
            .cornerRadius(5)
        }
        .frame(height: 10)
    }
}

