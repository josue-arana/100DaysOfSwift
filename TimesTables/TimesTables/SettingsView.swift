//
//  SettingsView.swift
//  TimesTables
//
//  Created by Josue Arana on 3/5/22.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var settings : Settings
    @Binding var tabSelection : Int
    
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
                    
                    Picker("", selection: $settings.table) {
                            ForEach(2..<13) {
                                Text("Table of \($0)")
                            }
                    }
                    .frame(width: 175)
                    .pickerStyle(.wheel)
                     
                    
                    Text("Number of questions")
                        .font(.title2)
                        .foregroundColor(Color("Selected"))
                        .padding(.bottom,5)
                    
                    Text("\(settings.questions)")
                        .font(.title2)
                        .foregroundColor(Color("Selected"))
                    
                    HStack{
                        Spacer()
                        Stepper("", value: $settings.questions,
                                in: questionRange,
                                step: 5)
                        .frame(width: 100, height: 50, alignment: .center)
                        .padding(.bottom)
                        Spacer()
                    }
                    
                    HStack{
                       
                        Button(action: {
                            self.tabSelection = 1
                        }) {
                            Text("BEGIN")
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Button(action: {
                            showStudyTable.toggle()
                        }) {
                            Text(showStudyTable ? "Hide Table" : "Study Table")
                                .font(.title3)
                                .foregroundColor(.white )
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                    }
                    .padding(40)
                    
                    
                    
                    if showStudyTable{
                        VStack{
                            ForEach(1..<13, id:\.self){ num in
                                let res = (settings.table+2)*num
                                Text(" \(settings.table+2)  x  \(num)  =  \(res) ")
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

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
