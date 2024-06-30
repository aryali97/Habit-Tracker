//
//  Habit.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 6/29/24.
//

import Foundation
import SwiftUI

struct Habit: Identifiable, Hashable {
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
        color: Color,
        habitType: HabitType = HabitType.increase,
        goal: Goal = Goal(count: 5, unit: Unit.count, frequency: Frequency.daily)) {
        self.id = id
        self.name = name
        self.description = description
        self.emoji = emoji
        self.color = color
        self.habitType = habitType
        self.goal = goal
    }

    static func == (lhs: Habit, rhs: Habit) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Habit {
    static let sampleData: [Habit] = [
        Habit(
            name: "Piano",
            description: "30 minutes",
            emoji: "🎹",
            color: PastelColor.red.color),
        Habit(
            name: "Stretch",
            emoji: "🧘",
            color: PastelColor.blue.color,
            habitType: HabitType.increase,
            goal: Goal(count: 6, unit: Unit.min, frequency: Frequency.daily)),
        Habit(
            name: "Call Parents",
            emoji: "📞",
            color: PastelColor.deepPurple.color,
            habitType: HabitType.increase,
            goal: Goal(count: 3, unit: Unit.count, frequency: Frequency.weekly))
    ]
}
