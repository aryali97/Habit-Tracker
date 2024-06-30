//
//  HabitCardView.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 6/29/24.
//

import SwiftUI

struct HabitCardView: View {
    let habit: Habit
    
    var body: some View {
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
            Text("0/\(habit.goal.count)")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(habit.color))
    }
}

#Preview {
    HabitCardView(habit: Habit.sampleData[0])
}
