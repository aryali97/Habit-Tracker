//
//  NewHabitView.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 6/29/24.
//

import SwiftUI

struct NewHabitView: View {
    @StateObject var habit: Habit = Habit(name: "", color: PastelColor.allCases.randomElement()!.color)
    @State var isPresentingColorPickerView: Bool = false
    @Binding var habits: [Habit]
    @Binding var dailyHabitRecords: [Habit: HabitRecord]
    @Binding var isPresentingNewHabitView: Bool

    var body: some View {
        NavigationStack {
            HabitEditView(
                habit: habit,
                isPresentingColorPickerView: $isPresentingColorPickerView)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewHabitView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            habits.append(habit)
                            dailyHabitRecords[habit] = HabitRecord(
                                habit: habit,
                                recordFrequency: Frequency.daily,
                                date: Date())
                            isPresentingNewHabitView = false
                        }
                    }
                }
        }
        .sheet(isPresented: $isPresentingColorPickerView) {
            ColorPickerFormView(
                habit: habit,
                isPresentingColorPickerView: $isPresentingColorPickerView)
        }
    }
}

#Preview {
    NewHabitView(
        habits: .constant(Habit.sampleData),
        dailyHabitRecords: .constant(HabitRecord.sampleMapping),
        isPresentingNewHabitView: .constant(true))
}
