//
//  ContentView.swift
//  TimesTables
//
//  Created by Josue Arana on 3/2/22.
//

import SwiftUI

 

struct ContentView: View {
    
    
    @ObservedObject var settings : Settings
    
    @State private var tables = [1,2,3,4,5,6,7,8,9,10,11,12]
    @State private var correctAnswer = 0
    @State private var userAnswers = [Int]()
    @State private var tableNumber = 0
    @State private var xnumber = 2
    @State private var questions = 0
    @State private var isActive = false
    
    
    @State private var choiceSelected = false
    @State private var userAnswer = 0
    @State private var answerNumber = -1
    @State private var checkAnswer = true
    
    @State private var isCorrect = true
    @State private var showAlert = false
    
    
    
    @State private var isShowingSheet = false
    
    
    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    let backgroundColor = Color(red: 34.0, green: 54.0, blue: 79.0)
    
    var body: some View {
        
        
        ZStack{
            
            VStack {
                //Tracking Bar
                HStack{
                    
                    Menu {
                        Button("Restart"){
                            restart()
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
                    
                    
                    Image(systemName: "heart.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                    Text("5")
                        .foregroundColor(.red)
                        .offset(x:-5)
                    
                    
//                    Button(action: {
////                                isShowingSheet.toggle()
//                            }) {
//                                Image(systemName: "heart.fill")
//                                    .font(.title2)
//                                    .foregroundColor(.red)
//                                Text("5")
//                                    .foregroundColor(.red)
//                                    .offset(x:-5)
//                            }
////                            .sheet(isPresented: $isShowingSheet,
////                                   onDismiss: didDismiss) {
////                                SettingsView()
////                            }
                }
                
                //Question Space
//                Spacer()
                
                VStack {
                    HStack{
                        Text("Table of \(settings.table+2)")
                            .font(.title2)
                            .foregroundColor(Color("Selected"))
                            .padding(.leading)
                        
                        Spacer()
                    }
                    .padding(.bottom, 35)
                
                    if isActive {
                        HStack{
                            Text("\(settings.table+2) x \(xnumber) = ?? ")
                                .font(.system(size: 50))
                                .foregroundColor(Color("Selected"))
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 250)
                .padding()
                
                
                
                Spacer()
                
                //Choices, grid of 4
                VStack(spacing:20) {
                    
                    if isActive {
                        
                        HStack(spacing:20){
                            
                            Button(action: {
                                userAnswer = userAnswers[0]
                                answerNumber = 0
                                
                            }) {
                                Text("\(userAnswers[0])")
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .frame(width: 100, height: 85)
                                    .foregroundStyle(answerNumber == 0 ? Color("Selected") : Color("Font"))
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(answerNumber == 0 ? Color("Selected") : Color("Font"), lineWidth: 5)
                                           
                                    )
                                    .opacity(answerNumber == 0 ? 1 : 0.5)
                            }
                            
                            Button(action: {
                                userAnswer = userAnswers[1]
                                answerNumber = 1
                            }) {
                                Text("\(userAnswers[1])")
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .frame(width: 100, height: 85)
                                    .foregroundStyle(answerNumber == 1 ? Color("Selected") : Color("Font"))
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(answerNumber == 1 ? Color("Selected") : Color("Font"), lineWidth: 5)
                                    )
                                    .opacity(answerNumber == 1 ? 1 : 0.5)
                                
                            }
                            
                        }
                        HStack(spacing: 20){
                            Button(action: {
                                userAnswer = userAnswers[2]
                                answerNumber = 2
                            }) {
                                Text("\(userAnswers[2])")
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .frame(width: 100, height: 85)
                                    .foregroundStyle(answerNumber == 2 ? Color("Selected") : Color("Font"))
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(answerNumber == 2 ? Color("Selected") : Color("Font"), lineWidth: 5)
                                    )
                                    .opacity(answerNumber == 2 ? 1 : 0.5)
                            }
                            Button(action: {
                                userAnswer = userAnswers[3]
                                answerNumber = 3
                            }) {
                                Text("\(userAnswers[3])")
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .frame(width: 100, height: 85)
                                    .foregroundStyle(answerNumber == 3 ? Color("Selected") : Color("Font"))
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(answerNumber == 3 ? Color("Selected") : Color("Font"), lineWidth: 5)
                                    )
                                    .opacity(answerNumber == 3 ? 1 : 0.5)
                            }
                        }
                        .padding(.bottom, 50)
                    }
                }
                
                Spacer()
                
                //Check button
                Button(action: {
                    if isActive {
                        checkQuestion(choice: userAnswer)
                        withAnimation {
                            showAlert = true
                        }
                    }else{
                        start()
                    }
                    
                }) {
                    if isActive {
                        Text(checkAnswer ? "CHECK" : "CONTINUE")
                    } else{
                        Text("START")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background( !isActive ? .blue : .green )
                .foregroundColor(.white)
                .font(.system(size: 17))
                .cornerRadius(15)
                .padding()
                
                if !isActive {
                    Spacer()
                }
            
                
            } // zstack
            .alert(isCorrect ? "Correct" : "Ops! The answer was \(correctAnswer)", isPresented: $showAlert) {
                    }
        }
    }
    
    func generateAnswerOptions() {
        
        let tab = settings.table+2
        userAnswers.removeAll()
        userAnswers.append(tab * xnumber + settings.table)
        userAnswers.append(tab * xnumber + xnumber)
        userAnswers.append(tab * xnumber)
        userAnswers.append(tab * xnumber + xnumber + xnumber)
        userAnswers.shuffle()
    }
    
    func start() {
        xnumber = Int.random(in: 2..<13)
        tableNumber = settings.table
        questions = settings.questions
        
        generateAnswerOptions()
        withAnimation {
            isActive = true
        }
        
    }
    
    func restart() {
        
        generateAnswerOptions()
        tables = [1,2,3,4,5,6,7,8,9,10,11,12]
        tables.shuffle()
        xnumber = tables.removeFirst()
        answerNumber = -1
        questions -= 1
    }
    
    func checkQuestion(choice: Int) {
        
        correctAnswer = (settings.table+2) * xnumber
        
        if choice == correctAnswer {
            isCorrect = true
        }else{
            isCorrect = false
        }
        nextQuestion()
    }
     
    func nextQuestion(){
        
        if tables.count <= 0 {
            tables = [1,2,3,4,5,6,7,8,9,10,11,12]
            tables.shuffle()
        }
        
        answerNumber = -1
        questions -= 1
        //next question
        xnumber = tables.removeFirst()
        generateAnswerOptions()
        
    }
    
    
    
    
    
    func didDismiss() {
            // Handle the dismissing action.
        }
}

//struct ContentView_Previews: PreviewProvider {
//    var settings: Settings = Settings()
//    static var previews: some View {
//        ContentView(settings: settings )
//    }
//}
