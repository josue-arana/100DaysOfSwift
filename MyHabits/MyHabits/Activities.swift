//
//  Activities.swift
//  MyHabits
//
//  Created by Josue on 4/18/22.
//

import Foundation


class Activities: ObservableObject {
    
    @Published var activities = [Activity]()
    
    @Published var title: String
    @Published var description: String
    @Published var streak: Int = 0
    
    init() {
        self.title = "title"
        self.description = "description"
    }
    
}
