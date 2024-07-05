//
//  ColorPickerView.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 7/5/24.
//

import SwiftUI

struct ColorPickerView: View {
    @Binding var selectedPastelColor: PastelColor
    let cols: Int = 5

    var body: some View {
//        for i in 0...((PastelColor.allCases.count - 1) / self.cols) {
        VStack {
            ForEach (0...((PastelColor.allCases.count - 1) / self.cols), id: \.self) { i in
                HStack {
                    ForEach (0..<5) { j in
                        let pastelColorIdx = (i * self.cols) + j
                        let pastelColor = PastelColor.allCases[pastelColorIdx]
                        
                        Button(action: {
                            selectedPastelColor = pastelColor
                        }) {
                            Circle()
                                .fill(pastelColor.color)
                                .overlay(
                                    Circle()
                                        .stroke(
                                            Color.gray,
                                            lineWidth: self.selectedPastelColor == pastelColor ? 3 : 0)
                                )
                        }
                    }
                }
            }
        }.padding()
    }
}

#Preview {
    ColorPickerView(selectedPastelColor: .constant(PastelColor.allCases[0]))
}
