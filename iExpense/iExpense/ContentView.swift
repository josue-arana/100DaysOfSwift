//
//  ContentView.swift
//  iExpense
//
//  Created by Josue Arana on 3/7/22.
//

import SwiftUI

struct User : Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var current = 0
    
    @State private var user = User(firstName: "Juan", lastName: "Melon")
    
    var body: some View {
        
        
        
        NavigationView {
            VStack{
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add number"){
                    numbers.append(current)
                    current += 1
                    
                    //save user
                    let encoder = JSONEncoder()
                    if let data = try? encoder.encode(user) {
                        UserDefaults.standard.set(data, forKey: "UserData")
                    }
                        
                    
                    
                }
            }
            .navigationTitle("OnDelete()")
            .toolbar {
                EditButton()
            }
        }
        
        
    }
    
    func removeRows(at offsets: IndexSet ){
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
