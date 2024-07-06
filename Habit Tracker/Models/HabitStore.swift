//
//  HabitStore.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 7/6/24.
//

import Foundation

@MainActor
class HabitStore : ObservableObject {
    @Published var habits: [Habit] = Habit.sampleData
}
