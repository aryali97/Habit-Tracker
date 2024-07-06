//
//  HabitEditorView.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 6/29/24.
//

import SwiftUI

struct HabitEditorView: View {
    @StateObject var habit: Habit
    @State var isPresentingColorPickerView: Bool
    @Binding var habits: [Habit]
    @Binding var isPresentingEditHabitView: Bool
    private var habitToEditIdx: Int

    init(
        habits: Binding<[Habit]>,
        isPresentingEditHabitView: Binding<Bool>,
        habitToEditIdx: Int) {
        self._habit = StateObject(wrappedValue: habits[habitToEditIdx].wrappedValue)
        self.isPresentingColorPickerView = false
        self._habits = habits
        self._isPresentingEditHabitView = isPresentingEditHabitView
        self.habitToEditIdx = habitToEditIdx
    }

    var body: some View {
        NavigationStack {
            HabitEditView(
                habit: habit,
                isPresentingColorPickerView: $isPresentingColorPickerView)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingEditHabitView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            print("SAVING")
                            print(habit.color)
                            print(habits[habitToEditIdx].color)
                            habits[habitToEditIdx] = habit
                            print("-")
                            print(habit.color)
                            print(habits[habitToEditIdx].color)
                            isPresentingEditHabitView = false
                        }
                    }
                }
        }
        .sheet(isPresented: $isPresentingColorPickerView) {
            ColorPickerFormView(
//                selectedPastelColor: $habit.color,
                habit: habit,
                isPresentingColorPickerView: $isPresentingColorPickerView)
        }
        .onDisappear {
            print("DISAPPEARING")
            print(habits[habitToEditIdx].color)
        }
    }
}

#Preview {
    HabitEditorView(
        habits: .constant(Habit.sampleData),
        isPresentingEditHabitView: .constant(true),
        habitToEditIdx: 0
    )
}
