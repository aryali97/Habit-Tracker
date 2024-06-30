//
//  HabitType.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 6/29/24.
//

import Foundation

enum HabitType: String, CaseIterable, Identifiable {
    case increase
    case decrease

    var name: String {
        rawValue.capitalized
    }

    var id: String {
        name
    }
}
