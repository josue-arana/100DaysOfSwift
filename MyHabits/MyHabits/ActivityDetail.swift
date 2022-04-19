//
//  ActivityDetail.swift
//  MyHabits
//
//  Created by Josue on 4/18/22.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
        .frame(height: 2)
        .foregroundColor(.primary)
        .padding(.vertical)
    }
}



struct ActivityDetail: View {
    
    let title: String
    let description: String
    let streak: Int
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    
                    Text(title)
                        .font(.title.bold())
                        .padding()
                    
                    Image(systemName: "figure.walk")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.2)
                        .padding()
                    
                    CustomDivider()
                    
                    Text(description)
                        .font(.headline)
                        .padding()
                    
                    Text("Streak: \(streak)")
                        .font(.title)
                        .padding()
                     
                }
                
                
            } //End ScrollView
            
            
        }
    }
}

struct ActivityDetail_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetail(title: "WALK", description: "Walk at least 1 mile", streak: 0)
    }
}
