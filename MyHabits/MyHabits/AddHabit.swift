//
//  AddHabit.swift
//  MyHabits
//
//  Created by Josue on 4/19/22.
//

import SwiftUI
  

struct AddHabit: View {
    
    @ObservedObject var activities: Activities
    @State var saveLabel: Bool
    @State private var selectedButtonIdx = -1
    
    @Environment(\.dismiss) private var dismiss
    
    private let suggestedHabbits: [Activity] = [
        Activity(title: "Drink More Water", description: "Take a step in the right direction", streak: 0),
        Activity(title: "Read 5 Pages a Day", description: "Use this time to do soemthing new", streak: 0),
        Activity(title: "Workout", description: "Small habits, big results", streak: 1)
    ]
    @State private var selectedActivity: Activity = Activity(title: "", description: "", streak: 0)
    
    var body: some View {
        NavigationView{
            
            
            ScrollView(.vertical) {

                
                ForEach(0..<3) { i in
                        HStack {
                            
                            Button {
                                selectedActivity.title = suggestedHabbits[i].title
                                selectedActivity.description = suggestedHabbits[i].description
                                selectedActivity.streak = suggestedHabbits[i].streak
                                saveLabel = true
                                selectedButtonIdx = i
                            } label: {
                                VStack (alignment: .leading){
                                    Text(suggestedHabbits[i].title)
                                        .font(.system(size: 20))
                                    Text(suggestedHabbits[i].description)
                                        .font(.system(size: 15))
                                }
                                Spacer()
                                VStack {
                                    Text("\(suggestedHabbits[i].streak)")
                                        .font(.title3)
                                    Text("Streak")
                                        .font(.system(size: 10))
                                }
                            }
                            .padding()
                            .foregroundColor(.primary)
                            .background( i == selectedButtonIdx ? .blue.opacity(0.3) : .blue.opacity(0.6))
                            .cornerRadius(20)
                            
                            
                        }
                         
                        
                    }
                    .padding(.horizontal)
//                }
                
            }//end scroll view
            .navigationTitle("Add Habit")
            .preferredColorScheme(.dark)
            .toolbar {
                
                Button( saveLabel ? "Save" : "Close"){
                    if saveLabel {
                        activities.activities.append(selectedActivity)
                        dismiss()
                    } else {
                        dismiss()
                    }
                }
            }
        }
        
    
    }
     
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(activities: Activities(), saveLabel: false)
    }
}
