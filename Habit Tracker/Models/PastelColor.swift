//
//  PastelColor.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 6/30/24.
//

import SwiftUI

enum PastelColor: String, CaseIterable, Identifiable {
    case purple
    case deepPurple
    case indigo
    case blue
    case lightBlue
    case cyan
    case teal
    case green
    case lightGreen
    case lime
    case yellow
    case amber
    case orange
    case red
    case pink

    var color: Color {
        Color("\(rawValue)100")
    }

    var name: String {
        rawValue.capitalized
    }

    var id: String {
        name
    }
}
