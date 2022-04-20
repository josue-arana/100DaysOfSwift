//
//  ContentView.swift
//  MyHabits
//
//  Created by Josue on 4/18/22.
//ac

import SwiftUI

struct ContentView: View {
    
    @StateObject var activityList = Activities()
    @State private var showHabits: Bool  = true
    @State private var showingAddHabit : Bool  = false

    let tips = [
        """
        How to Be
        Productive
        """,
        """
        How to Learn a
        New Skill
        """,
        """
        How to Be
        Healthy
        """,
        """
        How to Care for
        Mental Health
        """
    ]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
        
            ScrollView {
                
                Group {
                    HStack {
                        Spacer()
                        Button{
                            showHabits = true
                        } label: {
                            Text("Habits")
                                .font(.title2)
                            
                            .foregroundColor(.white)
                        }
                        Spacer()
                        Text("|")
                            .font(.title2)
                        Spacer()
                        Button{
                            showHabits = false
                        } label: {
                            Text("Programs")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .padding()
                    
                    ScrollView(.vertical, showsIndicators: false){
                          
                        
                        if showHabits {
                        
                            Section ("Current Habits") {
//                                List {
                                    ForEach(activityList.activities) { activity in
                                        NavigationLink {
                                            ActivityDetail(title: "Walk", description: "Walk 1 mile every day", streak: 0)
                                        } label: {
                                            HStack {
                                                
                                                ZStack {
                                                    Circle()
                                                        .fill(.primary)
                                                        .frame(width: 65, height: 65)
                                                        .opacity(0.5)
                                                    Image(systemName: "figure.walk")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 40, height: 40, alignment: .center)
                                                        .foregroundColor(.white)
                                                        .padding()
                                                }
                                                .padding(.leading, 10)
                                                
                                                VStack (alignment: .leading){
                                                    Text(activity.title)
                                                        .font(.system(size: 20))
                                                    Text(activity.description)
                                                        .font(.system(size: 15))
                                                }
                                                
                                                Spacer()
                                                VStack {
                                                    Text("\(activity.streak)")
                                                        .font(.title3)
                                                    Text("Streak")
                                                        .font(.system(size: 10))
                                                }
                                                .padding(.horizontal)
                                                
                                            }
                                            .frame(width: 300, height: 75)
                                            .background(.white)
                                            .cornerRadius(25)
                                        }
                                    }
//                                }
                            }
                            .background(.darkBackground.opacity(0.5))
                            
                        }else{
                                VStack(spacing: 20) {
                                        ForEach(tips, id: \.self){ tip in
                                            
                                            HStack{
                                                
                                                VStack(alignment: .leading) {
                                                    Text(tip)
                                                        .font(.system(size: 17, weight: .bold, design: .rounded))
                                                    
                                                    Button {  } label: {
                                                        Text("Start")
                                                            .font(.system(size: 15))
                                                            .foregroundColor(.black)
                                                            .padding(10)
                                                            .frame(width: 60, height: 25)
                                                            
                                                    }
                                                    .background(.yellow)
                                                    .cornerRadius(25)
                                                     
                                                    Spacer()
                                                    HStack{
                                                        Image(systemName: "calendar")
                                                        Text("15 Days")
                                                            .font(.system(size: 17))
                                                    }
                                                }
                                                .frame(height: 130)
                                                .padding(20)
                                                .background(.blue.opacity(0.7))
                                                
                                                Spacer()
                                            
                                                
                                            }
                                            .frame(width: 320)
                                            .background(Image("Image"))
                                            .cornerRadius(20)
                                             
                                        }
                                    }
                                    .padding()
                                        
                        }
                    }
                    
                    
                }
            }
            .navigationTitle("HabitTracker")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button{
                    showingAddHabit = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
            }
            .sheet(isPresented: $showingAddHabit){
                AddHabit(activities: activityList)
                
            }
            
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
