//
//  Habit_TrackerApp.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 6/29/24.
//

import SwiftUI

@main
struct HabitTrackerApp: App {
    @State private var habits: [Habit] = Habit.sampleData

    var body: some Scene {
        WindowGroup {
            DailyView(habits: $habits)
        }
    }
}
