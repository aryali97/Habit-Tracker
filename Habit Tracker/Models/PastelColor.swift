//
//  PastelColor.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 6/30/24.
//

import SwiftUI

enum PastelColor: String, CaseIterable, Identifiable {
    case blue
    case deepPurple
    case indigo
    case pink
    case purple
    case red

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
