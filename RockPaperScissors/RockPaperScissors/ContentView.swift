//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Josue Arana on 2/19/22.
//

import SwiftUI

struct ContentView: View {
    
//    private var options = ["🤛", "🖐", "✌️"]
    private var options = ["🪨", "📄", "✂️"]
    private var rock = "🪨"
    @State private var appChoice: String = "🪨"
    @State private var shouldWin: Bool = true
    @State private var score: Int = 0
    @State private var isCorrect: Bool = false
    @State private var isPresented = false
    
    private var gameRules = """
    if the app chose “Rock” and “Win” the player would need to choose “Paper”, but if the app chose “Rock” and “Lose” the player would need to choose “Scissors”.
    """
    
    func startGame() {
        appChoice = options[Int.random(in: 0..<options.count)]
        shouldWin = Bool.random()
    }
    func askQuestion(){
        appChoice = options[Int.random(in: 0..<options.count)]
        shouldWin.toggle()
    }
    
    func checkChoice(appChoice:String, playerChoice: String, shouldWin: Bool) -> Bool {
        
        var answer: String
        
        if shouldWin { //player should win
            if appChoice == "🪨" {
                answer = "📄"
            } else if appChoice == "📄" {
                answer = "✂️"
            } else {
                answer = "🪨"
            }
        } else { //player should lose
            if appChoice == "🪨" {
                answer = "✂️"
            } else if appChoice == "📄" {
                answer = "🪨"
            } else {
                answer = "📄"
            }
        }
        
        return answer == playerChoice
    }
    
    
    var body: some View {
        
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red:0.1, green: 0.2, blue:0.45), location: 0),
                .init(color: .cyan, location: 0.75)
            ], center: .center, startRadius: 275, endRadius: 60)
                .ignoresSafeArea()
            
            VStack{
                Button("Start Game"){
                    startGame()
                }
                Text("Game Rules:")
                Text(gameRules)
            }
            
            VStack {
               
                //player's score
                Text("Score: \(score)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
                Spacer()
                
                VStack (spacing: 25) {
                    
                    //Apps move
                    Text("App Choice")
                        .font(.title)
                        .foregroundStyle(.secondary)
                    Text(appChoice)
//                        .rotationEffect(appChoice != rock ? .degrees(-90) : .degrees(0))
                        .font(.system(size: 150))
                    
                    //Win or Lose
                    Text(shouldWin ? "You Win" : "You Lose")
                        .padding()
                        .font(.largeTitle)
                        .frame(width: 1000, height: 40, alignment: .center)
                        .background(.white)
                        .cornerRadius(20)
                    
                    Text("Player Choice")
                        .font(.title)
                        .foregroundStyle(.secondary)
                    HStack (spacing: 15) {
                        Spacer()
                        ForEach(options, id: \.self) { option in
                            
                            if option != appChoice {
                                Button (option){
                                    isCorrect = checkChoice(appChoice: appChoice, playerChoice: option , shouldWin: shouldWin)
                                    isPresented = true
                                }
                                .font(.system(size: 100))
                                .padding()
                            }
                        }
                        Spacer()
                    } // END: Hstack player choice buttons
                } //End: VStack spacing 25
                
                Spacer()
                } // End: Vstack with score
                .padding()
        } // End: Zstack
        .alert(isCorrect ? "Correct":"Wrong", isPresented: $isPresented) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(isCorrect ? "+10 pts" : "")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
