//
//  HabitEditorView.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 6/29/24.
//

import SwiftUI

struct HabitEditorView: View {
    @State var habit: Habit
    @Binding var habits: [Habit]
    @Binding var isPresentingEditHabitView: Bool
    private var habitToEditIdx: Int

    init(
        habits: Binding<[Habit]>,
        isPresentingEditHabitView: Binding<Bool>,
        habitToEditIdx: Int) {
        self.habit = habits[habitToEditIdx].wrappedValue
        self._habits = habits
        self._isPresentingEditHabitView = isPresentingEditHabitView
        self.habitToEditIdx = habitToEditIdx
    }

    var body: some View {
        NavigationStack {
            HabitEditView(habit: $habit)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingEditHabitView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            habits[habitToEditIdx] = habit
                            isPresentingEditHabitView = false
                        }
                    }
                }
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
