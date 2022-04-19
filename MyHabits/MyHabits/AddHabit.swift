//
//  AddHabit.swift
//  MyHabits
//
//  Created by Josue on 4/19/22.
//

import SwiftUI
  

struct AddHabit: View {
    
    @ObservedObject var activities: Activities
    
    private let suggestedHabbits: [Activity] = [
        Activity(title: "Trending Habbits", description: "Take a step in the right direction", streak: 5),
        Activity(title: "Staying at Home", description: "Use this time to do soemthing new", streak: 3),
        Activity(title: "Must-have Habits", description: "Small habits, big results", streak: 1)
    ]
    
    var body: some View {
        NavigationView{
            
            
            ScrollView(.vertical) {
                 
                
                
                List(suggestedHabbits) {
                    Text($0.title)
                }
                
                    ForEach(suggestedHabbits) { habbit in
                        HStack {
                            VStack (alignment: .leading){
                                Text(habbit.title)
                                    .font(.system(size: 20))
                                Text(habbit.description)
                                    .font(.system(size: 15))
                            }
                            Spacer()
                            VStack {
                                Text("\(habbit.streak)")
                                    .font(.title3)
                                Text("Streak")
                                    .font(.system(size: 10))
                            }
                        }
                        .padding()
                        .background(.darkBackground.opacity(0.6))
                        .cornerRadius(20)
                    }
                    .padding(.horizontal)
//                }
                
            }//end scroll view
            .navigationTitle("Add Habit")
            .preferredColorScheme(.dark)
            .toolbar {
                Button("Save"){
                    let habit = Activity(title: "New Habit", description: "Description", streak: 1)
                    activities.activities.append(habit)
                }
            }
        }
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(activities: Activities())
    }
}
