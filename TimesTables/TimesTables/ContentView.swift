//
//  ContentView.swift
//  TimesTables
//
//  Created by Josue Arana on 3/2/22.
//

import SwiftUI
import AVFoundation


struct ContentView: View {
    
    
    @ObservedObject var settings : Settings
    
    @State private var tables = [2,3,4,5,6,7,8,9,10,11,12]
    @State private var correctAnswer = 0
    @State private var userAnswers = [Int]()
    @State private var tableNumber = 0
    @State private var xnumber = 2
    @State private var questions = 0
    @State private var isActive = false
    @State private var progress: CGFloat = 0.0
    @State private var score = 0
    @State private var showScore = false
    
    @State private var animationSQ0 = 1.0
    @State private var animationSQ1 = 1.0
    @State private var animationSQ2 = 1.0
    @State private var animationSQ3 = 1.0
    
    @State private var userAnswer = 0
    @State private var answerNumber = -1
    @State private var checkedAnswer = false
    
    @State private var isCorrect = true
    @State private var showAlert = false
    
    
     
    var body: some View {
        
        
        ZStack{
            
            //Background Gradient
            LinearGradient(colors: [.green, .indigo ], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                if !isActive {
                    VStack{
                        Text("TimesTables")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .offset(y: 250)
                    }
                }
                
                //Table Number and Restart options
                HStack{
                    Spacer()
                    
                    if isActive {
                        Text("Table of \(settings.table+2)")
                            .font(isActive ? .title2 : .system(size: 25))
                            .foregroundColor(.white)
                            .offset(x: 25 , y: isActive ? 0 : 250)
                    
                        Spacer()
                        
                        Menu {
                            Button("Restart"){
                                restart()
                            }
                            Button("Quit"){
                                reset()
                            }
                            
                        } label: {
                            Image(systemName: "xmark")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                    } //is active
                }
                .padding(.trailing, 40)
                .padding(.top, 25)
                 
                
                //Tracking Bar
                if isActive {
                    ZStack(alignment: .leading){
                        
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundColor(.gray.opacity(0.8))
                            .frame(width: 250, height: 18)
                        
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundColor(.indigo.opacity(0.8))
                            .frame(width: 250*progress, height: 18)
                         
                         
                        Text(" \(questions) / \(Int(settings.questions))")
                            .font(.custom("HelveticaNeue", size: 12.0))
                            .offset(x:110)
                            .foregroundColor(.white)
                    }
                     
                }
                
                //Score View
                if showScore {
                    Spacer()
                    VStack(spacing:10) {
                        
                        Text("\(score)")
                            .font(.system(size: 100))
                            .foregroundStyle(.white)
                        Text("CORRECT")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Text("out of \(settings.questions) questions")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Button( action: {
                            restart()
                        }) {
                            Text("Continue")
                                .frame(width: 150, height: 50, alignment: .center)
                                .foregroundColor(.white)
                        }
                        .background(.black.opacity(0.8))
                        .cornerRadius(30)
                        .padding()
                    }
                }
                
                //Else show question with options
                else if isActive {
                    VStack {
                        HStack{
                            Text("\(settings.table+2) x \(xnumber) = ?? ")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                                .onChange(of: settings.table+2) { newValue in
                                    restart()
                                }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .padding()
                
                 
                
                    //Choices, grid of 4x4
                    VStack {
                        
                        HStack {
                            Button(action: {
                                userAnswer = userAnswers[0]
                                withAnimation {
                                    answerNumber = 0
                                    animationSQ0 += 360
                                }
                                checkedAnswer = true
                                
                            }) {
                                Text("\(userAnswers[0])")
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .frame(width: 65, height: 65)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(answerNumber == 0 ? .green : .white.opacity(0) )
                                    .border(.white, width: 5)
                                    .opacity(answerNumber == 0 ? 1 : 0.8)
                                    
                            }
                            .rotation3DEffect(.degrees(animationSQ0), axis: (x: 0, y: 0, z: answerNumber == 0 ? 1 : 0))
                            .animation(.easeInOut(duration: 2), value: 1)
                            
                            
                            Button(action: {
                                userAnswer = userAnswers[1]
                                answerNumber = 1
                                checkedAnswer = true
                                withAnimation {
                                    animationSQ1 += 360
                                }
                                
                            }) {
                                Text("\(userAnswers[1])")
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .frame(width: 65, height: 65)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(answerNumber == 1 ? .green : .white.opacity(0) )
                                    .border(.white, width: 5)
                                    .opacity(answerNumber == 1 ? 1 : 0.8)
                                
                            }
                            .rotation3DEffect(.degrees(animationSQ1), axis: (x: 0, y: 0, z: answerNumber == 1 ? 1 : 0))
                            .animation(.easeInOut(duration: 2), value: 1)
                            
                        }
                        
                        HStack {
                            
                            Button(action: {
                                userAnswer = userAnswers[2]
                                answerNumber = 2
                                checkedAnswer = true
                                
                                withAnimation {
                                    animationSQ2 += 360
                                }
                            }) {
                                Text("\(userAnswers[2])")
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .frame(width: 65, height: 65)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(answerNumber == 2 ? .green : .white.opacity(0) )
                                    .border(.white, width: 5)
                                    .opacity(answerNumber == 2 ? 1 : 0.8)
                            }
                            .rotation3DEffect(.degrees(animationSQ2), axis: (x: 0, y: 0, z: answerNumber == 2 ? 1 : 0))
                            .animation(.easeInOut(duration: 2), value: 1)
                            
                            Button(action: {
                                userAnswer = userAnswers[3]
                                answerNumber = 3
                                checkedAnswer = true
                                withAnimation {
                                    animationSQ3 += 360
                                }
                            }) {
                                Text("\(userAnswers[3])")
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .frame(width: 65, height: 65)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(answerNumber == 3 ? .green : .white.opacity(0) )
                                    .border(.white, width: 5)
                                    .opacity(answerNumber == 3 ? 1 : 0.8)
                                    
                            }
                            .rotation3DEffect(.degrees(animationSQ3), axis: (x: 0, y: 0, z: answerNumber == 3 ? 1 : 0))
                            .animation(.easeInOut(duration: 2), value: 1)
                        }
                        .padding(.bottom, 50)
                    
                    }
                } //end if is active
                
                Spacer()
                
                if !showScore {
                    VStack{
                    
                        //Check button
                        Button(action: {
                            if isActive && checkedAnswer {
                                checkQuestion(choice: userAnswer)
                            }else if !isActive {
                                start()
                            }
                            
                        }) {
                            if isActive {
                                Text("CHECK")
                                    .frame(maxWidth: .infinity, maxHeight: 50)
                            } else{
                                Text("START")
                                    .frame(maxWidth: .infinity, maxHeight: 50)
                            }
                        }
                        .background( !isActive ? .blue : .green )
                        .foregroundColor(.white)
                        .font(.system(size: 17))
                        .cornerRadius(20)
                        .padding(20)
                        .offset(y: -5)
                
                    
//                    if isActive {
//                        Button(action: {
//
//                        }) {
//                            Text("ADS HERE")
//                        }
//                        .frame(maxWidth: 275, maxHeight: 35, alignment: .center)
//                        .background(.white)
//                        .foregroundStyle(.indigo)
//                        .offset(y: -5)
//                    }
                    
                    
                    
                    }
                }
               
                //layout adjustment
                if !isActive {
                    Spacer()
                }
                    
                
            
                
            } // end zstack
            .alert(isCorrect ? "Correct" : "Nope! The answer was \(correctAnswer)", isPresented: $showAlert) {}
            
        }
    }
    
    func generateAnswerOptions() {
        
        let tab = settings.table+2
        userAnswers.removeAll()
        userAnswers.append((tab * xnumber) + settings.table+2)
        userAnswers.append((tab * xnumber) - xnumber)
        userAnswers.append(tab * xnumber)
        userAnswers.append(tab * xnumber + xnumber - 1)
        userAnswers.shuffle()
    }
    
    func start() {
        xnumber = Int.random(in: 2..<13)
        tableNumber = settings.table
        questions = 0
        progress = 0
        score = 0
        answerNumber = -1
        checkedAnswer = false
        
        generateAnswerOptions()
        withAnimation {
            isActive = true
        }
    }
    
    func restart() {
        showScore = false
        start()
    }
    
    func reset(){
        isActive = false
        showScore = false
    }
    
    func checkQuestion(choice: Int) {
        
        correctAnswer = (settings.table+2) * xnumber
        
        if choice == correctAnswer {
            isCorrect = true
            score += 1
            if settings.soundEffectsOn { AudioServicesPlaySystemSound(1052) }
            
        }else{
            withAnimation {
                isCorrect = false
                showAlert = true
            }
            if settings.soundEffectsOn { AudioServicesPlaySystemSound(1053) }
        }
        
        
        let progAmount: Double = (100.0/Double(settings.questions))
        addProgress(amount: progAmount)
        
        if questions < settings.questions-1 {
            nextQuestion()
        }else{
            withAnimation {
                showScore = true
            }
            
        }
        questions += 1
    }
     
    
    func nextQuestion(){
        
        if tables.count <= 0 {
            tables = [2,3,4,5,6,7,8,9,10,11,12]
            tables.shuffle()
        }
        answerNumber = -1
        checkedAnswer = false
        tables.shuffle()
        xnumber = tables.removeFirst()
        generateAnswerOptions()
    }
    
    func addProgress( amount : Double ) {
        withAnimation() {
            if self.progress < 1.0 {
                self.progress +=  (amount * 0.01)
            }
        }
    }
    
} //end Content View

//struct ContentView_Previews: PreviewProvider {
//    var settings: Settings = Settings()
//    static var previews: some View {
//        ContentView(settings: settings )
//    }
//}
