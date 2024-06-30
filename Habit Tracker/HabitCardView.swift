//
//  HabitCardView.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 6/29/24.
//

import SwiftUI

struct HabitCardView: View {
    let habit: Habit
    @Binding var habitRecord: HabitRecord
    
    private var progress: Double {
        return Double(habitRecord.count) / Double(habit.goal.count)
    }

    
    var body: some View {
        ProgressView(value: progress)
        HStack {
            Text(habit.emoji)
                .font(.title)
                .frame(alignment: .leading)
            VStack(alignment: .leading, spacing: 2) {
                Text(habit.name)
                if (!habit.description.isEmpty) {
                    Text("\(habit.description)")
                        .font(.caption)
                }
            }
            .frame(alignment: .leading)
            Spacer()
            VStack (alignment: .trailing, spacing: 2) {
                Text("\(habitRecord.count)/\(habit.goal.count)")
                Text(habit.goal.frequency.name)
                    .font(.caption)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(habit.color))
    }
}

#Preview {
    HabitCardView(
        habit: Habit.sampleData[0],
        habitRecord: .constant(HabitRecord(
            habit: Habit.sampleData[0],
            count: 1,
            recordFrequency: .daily,
            date: Date())))
}
