//
//  Settings.swift
//  TimesTables
//
//  Created by Josue Arana on 3/8/22.
//

import Foundation

class Settings: ObservableObject {
    @Published var table: Int = 2
    @Published var questions: Int = 5
}
