//
//  SettingsView.swift
//  TimesTables
//
//  Created by Josue Arana on 3/5/22.
//

import SwiftUI

struct SettingsView: View {
    @State private var table = 2
    @State var questions = 5
    let questionRange = 5...15
    let tablesRange = 2...12
    @State private var showStudyTable = false

    var body: some View {
        NavigationView{
            
            ScrollView {
                VStack{
                    
                    Text("Pick a table")
                        .font(.title2)
                        .foregroundColor(Color("Selected"))
                        .offset(y: 30)
                    
                    Picker("", selection: $table) {
                            ForEach(2..<13) {
                                Text("Table of \($0)")
                            }
                    }
                    .frame(width: 175)
                    .pickerStyle(.wheel)
                     
                    
                    Text("Number of Questions")
                        .font(.title2)
                        .foregroundColor(Color("Selected"))
                        .padding(.bottom,5)
                    
                    Text("\(questions)")
                        .font(.title2)
                        .foregroundColor(Color("Selected"))
                    
                    HStack{
                        Spacer()
                        Stepper("", value: $questions,
                                in: questionRange,
                                step: 5)
                        .frame(width: 100, height: 50, alignment: .center)
                        .padding(.bottom)
                        Spacer()
                    }
                    
                    
                    
                    Button(action: {
                        showStudyTable.toggle()
                    }) {
                        Text(showStudyTable ? "Hide Table" : "Show Table")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    
                    
                    
                    if showStudyTable{
                        VStack{
                            ForEach(1..<13, id:\.self){ num in
                                let res = (table+2)*num
                                Text(" \(table+2)  x  \(num)  =  \(res) ")
                                    .frame(width: 300, height: 20, alignment: .topLeading)
                                    .foregroundColor(Color("Selected"))
                            }
                            
                        }
                        .padding(.leading, 200)
                        .padding([.top, .bottom], 25)
                    }
                    
                    
                    
                }
            }
            .navigationTitle("Settings")
           
            
            
        }
        
      
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
