//
//  ContentView.swift
//  TimesTables
//
//  Created by Josue Arana on 3/2/22.
//

import SwiftUI

struct SettingsView: View {
    @State private var table = 2
    @State var questions = 5
    let questionRange = 5...15
    let tablesRange = 2...12

    var body: some View {
        VStack{
            Stepper(value: $table,
                    in: tablesRange,
                    step: 1) {
                Text("Practice table of \(table)")
                    .font(.title2)
                    .foregroundColor(Color("Selected"))
                    .padding(.leading)
            }
            .padding(10)
            
            
            
            Stepper(value: $questions,
                    in: questionRange,
                    step: 5) {
                Text("Questions \(questions)")
                    .font(.title2)
                    .foregroundColor(Color("Selected"))
                    .padding(.leading)
            }
            .padding(10)
            
        }
    }
}

 

struct ContentView: View {
    
    @State private var tables = [1,2,3,4,5,6,7,8,9,10,11,12]
    @State private var answer = 0
    @State private var tableNumber = 0
    @State private var secondNumber = 0
    
    
    @State private var choiceSelected = false
    @State private var answerNumber = -1
    @State private var checkAnswer = true
    @State private var isCorrect = true
    
    @State private var isShowingSheet = false
    
    
    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    let backgroundColor = Color(red: 34.0, green: 54.0, blue: 79.0)
    
    var body: some View {
        
        
        ZStack{
//            Color(.white)
//                .ignoresSafeArea()
           
            
            VStack {
                //Tracking Bar
                HStack{
                    
                    Menu {
                        Button("Restart"){
                            
                        }
                         
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    
                    Rectangle()
                        .fill(.green)
                        .frame(width: 210, height: 15, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .padding()
                    
                    
                        
                    Button(action: {
                                isShowingSheet.toggle()
                            }) {
                                Image(systemName: "heart.fill")
                                    .font(.title2)
                                    .foregroundColor(.red)
                                Text("5")
                                    .foregroundColor(.red)
                                    .offset(x:-5)
                            }
                            .sheet(isPresented: $isShowingSheet,
                                   onDismiss: didDismiss) {
                                SettingsView()
                            }
                
                }
                
                //Question Space
//                Spacer()
                
                VStack {
                    HStack{
                        Text("Table of 12")
                            .font(.title2)
                            .foregroundColor(Color("Selected"))
                            .padding(.leading)
                        
                        Spacer()
                    }
                    .padding(.bottom, 35)
                
                    HStack{
                        Text("12 x 12 = __ ")
                            .font(.system(size: 50))
                            .foregroundColor(Color("Selected"))
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 250)
                .padding()
                
                
                
                
                Spacer()
                //Choices, grid of 4
                VStack(spacing:20){
                    HStack(spacing:20){
                        
                        Button(action: {
                            print("1")
                        }) {
                            Text("124")
                                .fontWeight(.bold)
                                .font(.title)
                                .frame(width: 100, height: 85)
                                .foregroundStyle(answerNumber == 1 ? Color("Selected") : Color("Font"))
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color("Font") , lineWidth: 5)
//                                        .opacity(0.6)
                                )
                        }
                        
                        Button(action: {
                            print("2")
                        }) {
                            Text("224")
                                .fontWeight(.bold)
                                .font(.title)
                                .frame(width: 100, height: 85)
                                .foregroundStyle(answerNumber == 1 ? Color("Selected") : Color("Font"))
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color("Font"), lineWidth: 5)
                                )
                            
                        }
                        
                    }
                    HStack(spacing: 20){
                        Button(action: {
                            print("144")
                        }) {
                            Text("144")
                                .fontWeight(.bold)
                                .font(.title)
                                .frame(width: 100, height: 85)
                                .foregroundStyle(answerNumber == 1 ? Color("Selected") : Color("Font"))
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color("Font"), lineWidth: 5)
                                )
                        }
                        Button(action: {
                            print("120")
                        }) {
                            Text("240")
                                .fontWeight(.bold)
                                .font(.title)
                                .frame(width: 100, height: 85)
                                .foregroundStyle(answerNumber == 1 ? Color("Selected") : Color("Font"))
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color("Font"), lineWidth: 5)
                                )
                        }
                    }
                    .padding(.bottom, 50)
                }
                Spacer()
                //Check button
                Button(checkAnswer ? "CHECK" : "CONTINUE"){
                    //check if answer is correct here
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(choiceSelected ? .green : isCorrect ? .green : .red)
                .foregroundColor(.white)
                .font(.system(size: 17))
                .cornerRadius(15)
                .padding()
                
            } // zstack
        }
    }
    
    func generateQuestion() {
        
    }
    func didDismiss() {
            // Handle the dismissing action.
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
