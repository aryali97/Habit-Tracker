//
//  HabitEditView.swift
//  Habit Tracker
//
//  Created by Anirudh Ryali on 6/29/24.
//

import SwiftUI

struct HabitEditView: View {
    @Binding var habit: Habit
    
    private static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    var body: some View {
        VStack (alignment: .leading) {
            Section (header: Text("Name").bold()) {
                TextField("Name", text: $habit.name)
            }
            Section (header: Text("Description").bold()) {
                TextField("Description", text: $habit.description)
            }
            Section (header: Text("Icon & Color").bold()) {
                HStack {
                    Text("Icon")
                    TextField(habit.emoji, text: $habit.emoji)
                        .frame(width: 20)
                    Text("Color")
                    Spacer()
                }
            }
            Section (header: Text("Habit Type").bold()) {
                Picker(habit.habitType.name, selection: $habit.habitType) {
                    ForEach(HabitType.allCases) { habitType in
                        Text(habitType.name).tag(habitType)
                    }
                }
                .pickerStyle(.segmented)
            }
            Section (header: Text("Goal").bold()) {
                HStack {
                    TextField("\(habit.goal.count)", value: $habit.goal.count, formatter: Self.formatter)
                        .keyboardType(.numberPad)
                        .frame(width:20)
                    Picker(habit.goal.unit.name, selection: $habit.goal.unit) {
                        ForEach(Unit.allCases) { unit in
                            Text(unit.name).tag(unit)
                        }
                    }
                    .pickerStyle(.menu)
                    Text("/")
                    Picker(habit.goal.frequency.name, selection: $habit.goal.frequency) {
                        ForEach(Frequency.allCases) { frequency in
                            Text(frequency.name).tag(frequency)
                        }
                    }
                    .pickerStyle(.segmented)
                    Spacer()
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview {
    HabitEditView(habit: .constant(Habit(name: "")))
}
