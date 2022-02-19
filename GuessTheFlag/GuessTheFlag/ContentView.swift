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
                        
                        ForEach(0..<3) { number in
                            Button {
                                //flag was tapped
                                questionCount += 1
                                flagTapped(number)
                                
                                
                            } label: {
                                //Custom View modifier
                                FlagImage(of: countries[number])
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
            .alert(scoreTitle, isPresented: $showingScore){
//                if endGame {
//                    Button("Play Again", action: resetGame)
//                } else {
                    Button("Continue", action: askQuestion)
//                }
            } message: {
                Text("Your score is \(score)")
            }
        
            
        } //End ZStack
        .alert("Game Over", isPresented: $endGame){
            Button("Play Again", action: resetGame)
        }
            
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "#\(questionCount). Correct!  +10 Pts"
            score += 10
        } else {
            scoreTitle = "#\(questionCount). Wrong! That's the flag of \(countries[number])!"
        }
        
        showingScore = true
        
        if questionCount == 8 {
            endGame = true
//            scoreTitle = "Game Over"
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        countries.shuffle()
        questionCount = 0
        score = 0
//        endGame = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
