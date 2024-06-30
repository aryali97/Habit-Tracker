//
//  HabitRecord.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 6/30/24.
//

import Foundation

struct HabitRecord: Identifiable {
    var habit: Habit
    var count: Int
    var recordFrequency: Frequency
    var date: Date
    
    init(
        habit: Habit,
        count: Int = 0,
        recordFrequency: Frequency,
        date: Date) {
        self.habit = habit
        self.count = count
        self.recordFrequency = recordFrequency
        self.date = date
    }

    var id: String {
        "\(habit.id)-\(date)"
    }
}

extension HabitRecord {
    static private func getMappingInt(habits: [Habit], count: Int) -> [Habit: HabitRecord] {
        return Dictionary(
            uniqueKeysWithValues: habits.map {
                ($0, HabitRecord(habit: $0, count: count, recordFrequency: .daily, date: Date()))
            })
    }

    static public func getMapping(habits: [Habit]) -> [Habit: HabitRecord] {
        return getMappingInt(habits: habits, count: 0)
    }

    static let sampleMapping: [Habit: HabitRecord] = getMappingInt(habits: Habit.sampleData, count: 1)
}
