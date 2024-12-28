//
//  Tab4.swift
//  PomodoroFullApp
//
//  Created by Zhanel Amralina on 8/1/24.
//

import SwiftUI

struct Tab4: View {
    @State private var isBottomSheetVisible: Bool = true // Control the visibility of the bottom sheet

    var body: some View {
        ZStack {
            // Displaying Tab3 in the background
            Tab3()
                .blur(radius: isBottomSheetVisible ? 3 : 0) // Optional: add blur effect to the background

            if isBottomSheetVisible {
                overlayDimming
                bottomSheetContent
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var overlayDimming: some View {
        Color.black.opacity(0.3)
            .edgesIgnoringSafeArea(.all)
    }

    var bottomSheetContent: some View {
        VStack {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                VStack(spacing: 16) {
                    bottomSheetHeader
                        .padding(.top, 16)
                    Spacer()
                    CategoryGrid()
                }
                .padding(16)
            }
            .frame(height: 362)
            .transition(.move(edge: .bottom)) // Smooth transition for bottom sheet
        }
    }

    var bottomSheetHeader: some View {
        HStack {
            Text("Focus Categories")
                .font(.headline) // Adjust font style as needed
            Spacer()
            Button(action: {
                isBottomSheetVisible = false // Close bottom sheet
            }) {
                Image(systemName: "xmark")
                    .font(.system(size: 20))
            }
        }
    }
}

struct CategoryGrid: View {
    private var categories: [String] = ["Work", "Study", "Exercise", "Reading", "Meditation", "Other"]

    private var gridLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: gridLayout, spacing: 20) {
            ForEach(categories, id: \.self) { category in
                Text(category)
                    .font(.system(size: 14)) // Adjust font size as needed
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal, 8)
            }
        }
    }
}

struct Tab4_Previews: PreviewProvider {
    static var previews: some View {
        Tab4()
    }
}
