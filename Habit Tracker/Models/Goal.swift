//
//  Goal.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 6/29/24.
//

import Foundation

enum Unit: String, CaseIterable, Identifiable {
    case count
    // Time
    case sec
    case min
    case hr
    // Distance
    case km
    case mile
    // weight
    case g
    case mg
    case lb
    // food
    case Cal

    var name: String {
        rawValue.capitalized
    }

    var id: String {
        name
    }
}

enum Frequency: String, CaseIterable, Identifiable {
    case day
    case week
    
    var name: String {
        rawValue.capitalized
    }

    var id: String {
        name
    }
}

struct Goal {
    var count: Int
    var unit: Unit
    var frequency: Frequency
    
    init(count: Int, unit: Unit, frequency: Frequency) {
        self.count = count
        self.unit = unit
        self.frequency = frequency
    }
}
