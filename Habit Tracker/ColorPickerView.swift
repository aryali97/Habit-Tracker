//
//  ColorPickerView.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 7/5/24.
//

import SwiftUI

struct ColorPickerView: View {
    @Binding var selectedPastelColor: Color
    let cols: Int = 5
    var rows: Int {
        return ((PastelColor.allCases.count - 1) / self.cols) + 1
    }

    var body: some View {
        VStack {
            ForEach (0..<self.rows, id: \.self) { i in
                HStack {
                    ForEach (0..<5) { j in
                        let pastelColorIdx = (i * self.cols) + j
                        let pastelColor = PastelColor.allCases[pastelColorIdx]
                        
                        Button(action: {
                            selectedPastelColor = pastelColor.color
                        }) {
                            Circle()
                                .fill(pastelColor.color)
                                .overlay(
                                    Circle()
                                        .stroke(
                                            Color.gray,
                                            lineWidth: self.selectedPastelColor == pastelColor.color ? 3 : 0)
                                )
                        }
                    }
                }
            }
        }.padding()
    }
}

#Preview {
    ColorPickerView(selectedPastelColor: .constant(PastelColor.allCases[0].color))
}
