//
//  Activity.swift
//  MyHabits
//
//  Created by Josue on 4/18/22.
//

import SwiftUI

// This struct holds a single activity.
struct Activity: Identifiable {
    var id = UUID()
    let title: String
    let description: String
    let streak: Int
    
}
 
