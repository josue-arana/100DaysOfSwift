//
//  Activity.swift
//  MyHabits
//
//  Created by Josue on 4/18/22.
//

import Foundation

// This struct holds a single activity.
struct Activity : Identifiable {
    
    var id = UUID()
    var title: String
    var description: String
    var streak: Int
    
}
 
