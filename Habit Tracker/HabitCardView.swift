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
    @State private var progressPerc: Double
    @State private var dragStartProgressPerc: Double? = nil
    let impactMed: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)

    private var progress: Double {
        return Double(habitRecord.count) / Double(habit.goal.count)
    }

    init(habit: Habit, habitRecord: Binding<HabitRecord>) {
        self.habit = habit
        self._habitRecord = habitRecord
        self.progressPerc = Double(habitRecord.wrappedValue.count) / Double(habit.goal.count)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack (alignment:  .trailing) {
                Rectangle()
                    .fill(Color.white.opacity(0.4)) // Adjust the color and opacity as needed
                    .frame(
                        width: geometry.size.width * (1 - progressPerc), // 50% of the full width
                        height: 75
                    )
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
            }
            .gesture(DragGesture()
                .onChanged { value in
                    let xDist = value.location.x - value.startLocation.x
                    if (dragStartProgressPerc == nil) {
                        self.dragStartProgressPerc = Double(self.habitRecord.count) / Double(habit.goal.count)
                    }
                    self.progressPerc = max(min(self.dragStartProgressPerc! + Double(xDist)/300.0, 1.0), 0.0)
                    let newCount = Int(self.progressPerc * Double(habit.goal.count))
                    if (newCount != habitRecord.count) {
                        impactMed.impactOccurred()
                    }
                    habitRecord.count = newCount
                }
                .onEnded { value in
                    self.dragStartProgressPerc = nil
                    self.progressPerc = Double(self.habitRecord.count) / Double(habit.goal.count)
                })
            .clipShape(
                RoundedRectangle(cornerRadius: 12))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(habit.color))
            .frame(height: 75)
        }
    }
}

#Preview {
    HabitCardView(
        habit: Habit.sampleData[0],
        habitRecord: .constant(HabitRecord(
            habit: Habit.sampleData[0],
            count: 1,
            recordFrequency: .daily,
            date: Date()))
    )
}
