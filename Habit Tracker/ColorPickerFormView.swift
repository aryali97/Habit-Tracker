//
//  ColorPickerFormView.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 7/5/24.
//

import SwiftUI

struct ColorPickerFormView: View {
    @State var selectedColor: Color
    @ObservedObject var habit: Habit
    @Binding var isPresentingColorPickerView: Bool

    init(
        habit: Habit,
        isPresentingColorPickerView: Binding<Bool>) {
        self.selectedColor = habit.color
        self.habit = habit
        self._isPresentingColorPickerView = isPresentingColorPickerView
    }

    var body: some View {
        NavigationStack {
            ColorPickerView(selectedColor: $selectedColor)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            habit.color = selectedColor
                            isPresentingColorPickerView = false
                        }
                    }
                }
        }
    }
}

#Preview {
    ColorPickerFormView(
        habit: Habit.sampleData[0],
        isPresentingColorPickerView: .constant(true))
}
