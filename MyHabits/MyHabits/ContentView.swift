//
//  ContentView.swift
//  MyHabits
//
//  Created by Josue on 4/18/22.
//ac

import SwiftUI

struct ContentView: View {
    
    @StateObject var activityList = Activities()
    
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
                    
                    ScrollView(.horizontal, showsIndicators: true){
                         
                            
                            
                        HStack(spacing: 20) {
                                ForEach(tips, id: \.self){ tip in
                                    
                                    
                                    VStack(alignment: .leading) {
                                        Text(tip)
                                            .font(.title)
                                        Button {  } label: {
                                            Text("Start")
                                                .font(.title3)
                                                .foregroundColor(.black)
                                                .padding(10)
                                                .frame(width: 100, height: 25)
                                                
                                        }
                                        .background(.yellow)
                                        .cornerRadius(25)
                                         
                                        Spacer()
                                        HStack{
                                            Image(systemName: "calendar")
                                            Text("15 Days")
                                                .font(.title2)
                                                .foregroundColor(.gray)
                                                
                                        }
                                            
                                    }
                                    .frame(width: 300)
                                    .padding(20)
                                    .background(.darkBackground.opacity(0.8))
                                    .cornerRadius(20)
                                }
                                .frame(maxWidth: .infinity)
                            }
                            
                            .padding()
                                
                         
                        
                        
                    }
                    
                    
                    
                
                
                    List {
                        ForEach(activityList.activities) { activity in
                            NavigationLink {
                                ActivityDetail(title: "Walk", description: "Walk 1 mile every day", streak: 0)
                            } label: {
                                VStack {
                                    
                                    ZStack {
                                        Circle()
                                            .fill(.primary)
                                            .frame(width: 150, height: 150)
                                            .opacity(0.5)
                                        Image(systemName: "figure.walk")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100, alignment: .center)
                                            .foregroundColor(.white)
                                            .padding()
                                    }
                                    
                                        
                                }
                            }
                        }
                    }
                    
                    
                    
                }
            }
            .navigationTitle("HabitTracker")
            .background(Color(.black).opacity(0.5))
            .preferredColorScheme(.dark)
            
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
