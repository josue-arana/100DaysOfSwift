//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Josue Arana on 2/15/22.
//

import SwiftUI

//Custom View Modifier
struct flagImage: ViewModifier {
    var country : String
    
    func body(content: Content) -> some View {
        Image(country)
            .resizable()
            .renderingMode(.original)
            .clipShape(Circle())
            .frame(width: 125, height: 125)
            .shadow(radius: 55)
    }
}
struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}

struct BlueTitle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

//Extension for custom modifier.
extension View {
    func FlagImage(of country: String) -> some View {
        modifier(flagImage(country: country))
    }
    
    func blueTitle() -> some View {
        modifier(BlueTitle())
    }
}



struct ContentView: View {
    
    @State private var showingScore = false
    @State private var endGame = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questionCount = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland","Italy", "Nigeria", "Poland", "Russia", "Spain", "UK" , "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    //animation variables
    @State private var animationAmount = 0.0
    @State private var wrongChoice = 0.0
    @State private var playerChoseFlag = false
    @State private var isCorrect = false
    @State private var flagSelected = 10
    
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red:0.1, green: 0.2, blue:0.45), .gray, Color(red:0.1, green: 0.2, blue:0.45)]), startPoint: .top, endPoint: .bottom)
//            RadialGradient(stops: [
//                .init(color: Color(red:0.1, green: 0.2, blue:0.45), location: 0.4),
//                .init(color: Color(red:0.76, green: 0.15, blue:0.26), location: 0.4)
//            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack{
                VStack{
                    Spacer()
                    
                    Text("Guess the Flag")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                
                    VStack(spacing: 15){
                        
                        VStack{
                            Text("Tap the flag of")
                                .foregroundStyle(.secondary)
                                .font(.subheadline.weight(.heavy))
                            Text(countries[correctAnswer])
                                .blueTitle()
//                                .foregroundStyle(.primary)
//                                .font(.largeTitle.weight(.semibold))
                        }
                        
                        
                        
                        ForEach(0..<3, id: \.self) { flag in
                            
                            
                            Button {
                                //flag was tapped
                                questionCount += 1
                                flagSelected = flag
                                
                                isCorrect = flagTapped(flag)
                                playerChoseFlag = true
                                withAnimation {
                                    animationAmount += 360
                                    
                                    if !isCorrect {
                                        wrongChoice += 1
                                    }
                                    
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    askQuestion()
                                }
                                

                            } label: {
                                
                                if flagSelected == flag  {
                                    if isCorrect {
                                        FlagImage(of: countries[flag])
                                            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
                                            .animation(.easeInOut(duration: 2), value: 1)
                                    }else {
                                        FlagImage(of: countries[flag])
                                            .overlay(
                                                Circle()
                                                    .fill(.red)
                                                    .opacity(0.5)
                                            )
                                            .modifier(Shake(animatableData: wrongChoice))
                                    }
                                    
                                    
                                }
                                
                                else if playerChoseFlag {
                                    FlagImage(of: countries[flag])
                                        .opacity(0.25)
                                }else {
                                    FlagImage(of: countries[flag])
                                }
                            }


                        }
                        
                        
                        
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 30)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                    Spacer()
                    Spacer()
                    Text("Score: \(score)")
                        .foregroundColor(.white)
                        .font(.title.bold())
                    Spacer()
                }
                .padding()
                
            } // end first vstack
//            .alert(scoreTitle, isPresented: $showingScore){
////                if endGame {
////                    Button("Play Again", action: resetGame)
////                } else {
//                    Button("Continue", action: askQuestion)
////                }
//            } message: {
//                Text("Your score is \(score)")
//            }
        
            
        } //End ZStack
        .alert("Game Over", isPresented: $endGame){
            Button("Play Again", action: resetGame)
        }
            
    }
    
    func flagTapped(_ number: Int) -> Bool {
        var correct = false
        if number == correctAnswer {
            scoreTitle = "#\(questionCount). Correct!  +10 Pts"
            score += 10
            correct = true
        } else {
            scoreTitle = "#\(questionCount). Wrong! That's the flag of \(countries[number])!"
        }
        
        showingScore = true
        
        if questionCount == 8 {
            endGame = true
//            scoreTitle = "Game Over"
        }
        return correct
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        playerChoseFlag = false
        flagSelected = -1
    }
    
    func resetGame() {
        countries.shuffle()
        questionCount = 0
        score = 0
        playerChoseFlag = false
//        endGame = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
