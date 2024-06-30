//
//  Habit.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 6/29/24.
//

import Foundation
import SwiftUI

struct Habit: Identifiable {
    let id: UUID
    var name: String
    var description: String
    var emoji: String
    var color: Color
    var habitType: HabitType
    var goal: Goal

    init(
        id: UUID = UUID(),
        name: String,
        description: String = "",
        emoji: String = "😀",
        color: Color = Color.red100,
        habitType: HabitType = HabitType.increase,
        goal: Goal = Goal(count: 5, unit: Unit.count, frequency: Frequency.day)) {
        self.id = id
        self.name = name
        self.description = description
        self.emoji = emoji
        self.color = color
        self.habitType = habitType
        self.goal = goal
    }
}

extension Habit {
    static let sampleData: [Habit] = [
        Habit(
            name: "Piano",
            description: "30 minutes",
            emoji: "🎹"),
        Habit(
            name: "Stretch",
            emoji: "🧘",
            color: Color.blue100,
            habitType: HabitType.increase,
            goal: Goal(count: 6, unit: Unit.min, frequency: Frequency.day)),
        Habit(
            name: "Call Parents",
            emoji: "📞",
            color: Color.deepPurple100,
            habitType: HabitType.increase,
            goal: Goal(count: 3, unit: Unit.count, frequency: Frequency.week))
    ]
}
