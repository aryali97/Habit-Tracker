//
//  DailyView.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 6/29/24.
//

import SwiftUI

struct DailyView: View {
    @State private var habitToEditIdx: Int? = nil
    @State private var isPresentingNewHabitView = false
    @State private var isPresentingEditHabitView = false
    
    @Binding var habits: [Habit]
    @Binding var dailyHabitRecords: [Habit: HabitRecord]
    var value: Int = 0

    var body: some View {
        NavigationStack {
            HStack {
                Text("Today's Habits")
                    .font(.title)
                    .frame(alignment: .leading)
                Spacer()
                Button(action: {
                    isPresentingNewHabitView = true
                }) {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 24))
                }
            }
            VStack {
                ForEach($habits.indices, id: \.self) { index in
                    if let habitRecordBinding = bindingForHabitRecord(habit: habits[index]) {
                        HabitCardView(
                            habit: habits[index],
                            habitRecord: habitRecordBinding)
                        .onLongPressGesture {
                            habitToEditIdx = index
                            isPresentingEditHabitView = true
                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                            impactMed.impactOccurred()
                        }
                    }
                }
            }
            Spacer()
        }
        .padding()
        .sheet(isPresented: $isPresentingNewHabitView) {
            NewHabitView(
                habits: $habits,
                dailyHabitRecords: $dailyHabitRecords,
                isPresentingNewHabitView: $isPresentingNewHabitView
            )
        }
        .sheet(isPresented: $isPresentingEditHabitView) {
            HabitEditorView(
                habits: $habits,
                isPresentingEditHabitView: $isPresentingEditHabitView,
                habitToEditIdx: habitToEditIdx ?? 0)
        }
    }

    func bindingForHabitRecord(habit: Habit) -> Binding<HabitRecord>? {
        return Binding(
            get: {
                return dailyHabitRecords[habit]!
            },
            set: {
                dailyHabitRecords[habit] = $0
            }
        )
    }
}

#Preview {
    DailyView(
        habits: .constant(Habit.sampleData),
        dailyHabitRecords: .constant(HabitRecord.sampleMapping))
}
