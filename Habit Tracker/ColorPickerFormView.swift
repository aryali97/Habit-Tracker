//
//  ColorPickerFormView.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 7/5/24.
//

import SwiftUI

struct ColorPickerFormView: View {
//    @Binding var selectedPastelColor: Color
    @State var selectedColor: Color
//    @Binding var habit: Habit
    @ObservedObject var habit: Habit
    @Binding var isPresentingColorPickerView: Bool

    init(
//        habit: Binding<Habit>,
        habit: Habit,
        isPresentingColorPickerView: Binding<Bool>) {
        self.selectedColor = habit.color
        self.habit = habit
        self._isPresentingColorPickerView = isPresentingColorPickerView
    }

    var body: some View {
        NavigationStack {
//            ColorPickerView(habit: $habit)
            ColorPickerView(selectedColor: $selectedColor)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            print("SAVED")
                            print(selectedColor)
                            habit.color = selectedColor
                            print(habit.color)
                            isPresentingColorPickerView = false
                        }
                    }
                }
        }
    }
}

//#Preview {
//    
//    ColorPickerFormView(
//        habit: Habit.sampleData[0],
////        selectedPastelColor: .constant(PastelColor.red.color),
//        isPresentingColorPickerView: .constant(true))
//}
