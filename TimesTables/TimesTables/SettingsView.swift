//
//  SettingsView.swift
//  TimesTables
//
//  Created by Josue Arana on 3/5/22.
//

import SwiftUI


struct OptionSettingsView: View {
    
    
    init(settings: Settings){
        UITableView.appearance().backgroundColor = .clear
        self.settings = settings
    }
    
    @ObservedObject var settings : Settings
    @State var value = ""
    let questionRange = 5...15
    
    var body: some View {
        Form {
            Picker("Table Number", selection: $settings.table) {
                ForEach(2..<13) {
                    Text("Table of \($0)")
                }
            }
            
            Stepper("\(settings.questions) Questions " , value: $settings.questions,
                    in: questionRange,
                    step: 5)
                .padding(1)
            
            Toggle("Sounds", isOn: $settings.soundEffectsOn)
            
        }
        
    }
}

struct SettingsView: View {
    
    @ObservedObject var settings : Settings
    @Binding var tabSelection : Int
    
    @State private var table = 2
    @State var questions = 5
    
    let tablesRange = 2...12
    @State private var showStudyTable = false
    
    

    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(colors: [.green, .indigo ], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
               
                    OptionSettingsView(settings: settings)
                        .offset(y:-16)
                    
                    if showStudyTable {
                        VStack{
                            ForEach(1..<13, id:\.self){ num in
                                let res = (settings.table+2)*num
                                Text(" \(settings.table+2)  x  \(num)  =  \(res) ")
                                    .frame(maxWidth: 200 , maxHeight: 20, alignment: .topLeading)
                                    .foregroundColor(Color("Selected"))
                            }
                        }
                        .padding(.leading, 100)
                    }
                    
                    HStack{
                       
                        Button(action: {
                            withAnimation {
                                showStudyTable.toggle()
                            }
                            
                        }) {
//                          Text(showStudyTable ? "Hide Table" : "Study Table")
                            Image(systemName: showStudyTable ? "lightbulb.slash.fill": "lightbulb.fill" )
                                .font(.title2)
                                .foregroundColor(.white )
                            
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(.black)
                        .clipShape(Circle())
                            
                    }
                    .padding()
                    
                    
                    
                  
                    
                }.padding()
                
                     
            
                
            }// zstack end
            
            .navigationTitle("Settings")
            
        }
        
        
      
    }
}

//struct SettingsView_Previews: PreviewProvider {
////    var settings: Settings = Settings()
//    
//    static var previews: some View {
//        SettingsView(settings: Settings() )
//    }
//}
