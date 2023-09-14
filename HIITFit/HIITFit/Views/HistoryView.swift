//
//  HistoryView.swift
//  HIITFit
//
//  Created by metalwillhelpyou on 26.07.2023.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var history: HistoryStore
    @Binding var showHistory: Bool
    
    var headerView: some View {
        HStack {
            Spacer()
            Text("History")
                .font(.title)
            Spacer()
            Button {
                showHistory.toggle()
            } label: {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
        }
    }
    
    func dayView(day: ExerciseDay) -> some View {
        Section(
            header:
                Text(day.date.formatted(as: "MMM d"))
                .font(.headline)) {
                    exerciseView(day: day)
                }
    }
    
    func exerciseView(day: ExerciseDay) -> some View {
        ForEach(day.uniqueExercises, id: \.self) { exercise in
            Text(exercise)
                .badge(day.countExercise(exercise: exercise))
        }
    }
    
    var body: some View {
        VStack {
            headerView
                .padding()
            Form {
                ForEach(history.exerciseDays) { day in
                    dayView(day: day)
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var history = HistoryStore(preview: true)
    static var previews: some View {
        HistoryView(showHistory: .constant(true))
            .environmentObject(history)
    }
}
