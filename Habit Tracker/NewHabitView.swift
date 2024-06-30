//
//  NewHabitView.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 6/29/24.
//

import SwiftUI

struct NewHabitView: View {
    @State var habit: Habit = Habit(name: "")
    @Binding var habits: [Habit]
    @Binding var isPresentingNewHabitView: Bool

    var body: some View {
        NavigationStack {
            HabitEditView(habit: $habit)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewHabitView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            habits.append(habit)
                            isPresentingNewHabitView = false
                        }
                    }
                }
        }
    }
}

#Preview {
    NewHabitView(
        habits: .constant(Habit.sampleData),
        isPresentingNewHabitView: .constant(true))
}
