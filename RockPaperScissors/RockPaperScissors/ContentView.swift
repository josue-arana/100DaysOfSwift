//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Josue Arana on 2/19/22.
//

import SwiftUI


struct InstructionsView: View {
    
    private var gameRules = """
    The purpose of this game is to server as a brain teaser.
    
    Round Fules:
    The app will choose a move and tell the player as a rule that needs to win or lose the round. Then the player chooses one of the moves available that corresponds to the round rule.
    
    Coins:
    The player gets a coin for every correct
    
    Example:
    If the app chose “Rock” and “You need to Win” the player would need to choose “Paper”, but if the app chose “Rock” and “Lose” the player would need to choose “Scissors”.
    """
    
//    @State var closeView: Bool
    
    var body : some View {
        
        
        ZStack {
            LinearGradient(colors: [.black,.indigo], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
//                HStack{
//                    Spacer()
//                    Button(action: {
//                        closeView.toggle()
//                    }){
//                        Image(systemName: "x.circle")
//                            .resizable()
//                            .foregroundColor(.white)
//                            .frame(width: 25, height: 25, alignment: .trailing)
//                            .padding()
//                    }
//                }.padding(.trailing)
                
                Text("RPS GAME")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Text("(Rock Paper Scissors)")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(alignment: .center)
                Text("By Josue Arana")
                    .font(.title3)
                    .foregroundColor(.white)
                    .frame(alignment: .center)
                
                Text(gameRules)
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(30)
            }
        } //End zstack
    }
}



struct ContentView: View {
    
//    private var options = ["🤛", "🖐", "✌️"]
    private var options = ["rock", "paper", "scissors"]
    private var rock = "rock"
    @State private var appChoice: String = "rock"
    @State private var shouldWin: Bool = true
    @State private var score: Int = 0
    @State private var isCorrect: Bool = false
    @State private var showScore = false
    private var darkBlue = Color(red: 34, green: 56, blue: 100)
    
    @State private var showInstructions = true
    @State private var questionCount = 1
    @State private var correctPopUp = false
    @State private var incorrectPopUp = false
    
    
    
    func resetGame() {
        appChoice = options[Int.random(in: 0..<options.count)]
        shouldWin = Bool.random()
        questionCount = 1
        score = 0
    }
    func askQuestion(){
        appChoice = options[Int.random(in: 0..<options.count)]
        shouldWin.toggle()
        questionCount += 1
    }
    
    func checkChoice(appChoice:String, playerChoice: String, shouldWin: Bool) -> Bool {
        
        var answer: String
        
        if shouldWin { //player should win
            if appChoice == "rock" {
                answer = "paper"
            } else if appChoice == "paper" {
                answer = "scissors"
            } else {
                answer = "rock"
            }
        } else { //player should lose
            if appChoice == "rock" {
                answer = "scissors"
            } else if appChoice == "paper" {
                answer = "rock"
            } else {
                answer = "paper"
            }
        }
        
        return answer == playerChoice
    }
    
    
    var body: some View {
        
        ZStack{
            RadialGradient(stops: [
//                .init(color: Color(red:0.1, green: 0.2, blue:0.45), location: 0),
                .init(color: .black , location: 0),
                .init(color: .indigo, location: 0.75)
            ], center: .center, startRadius: 375, endRadius: 60)
                .ignoresSafeArea()
            
            
            
            VStack {
                
                HStack { //Instructions,
                    //Game Instructions menu button
                    Button(action: {
                        self.showInstructions.toggle()
                    })
                    {
                       Image(systemName: "circle.grid.cross.fill")
                           .resizable()
                           .foregroundColor(.white)
                           .frame(width: 30, height: 30, alignment: .leading)
                    }
                    .padding()
                    .frame(width: 100, height: 30)
                    .cornerRadius(30)
                    .sheet(isPresented: $showInstructions) {
                        InstructionsView()
                    }
                    Spacer()
                    ZStack{
                        Rectangle()
                            .fill(.thinMaterial)
                            .frame(width: 80, height: 30)
                            .cornerRadius(40)
                        
                        Text("\(score)")
                            .font(.title3)
                            .offset(x: 10)
                            .foregroundStyle(darkBlue)
                        
                        Image("thumbsUp")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .trailing)
                            .offset(x: -25)
                    }
                    .padding(.trailing)
                    
                }
                
                Spacer()
                
                
                VStack{
                    Text("Round \(questionCount)")
                        .font(.system(size: 23))
                        .foregroundStyle(.gray)
                    //Win or Lose
                    Text(shouldWin ? "You need to win" : "You need to lose")
                        .padding(.bottom)
                        .font(.system(size: 32))
                        .foregroundStyle(.white)
                }
                .offset(y:55)
                
                Spacer()
                
                VStack (spacing: 0) {
                    Spacer()
                    
                    //Apps move
                    ZStack{
                        
                        Image(appChoice)
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 200, height: 200)
                            .shadow(radius: 55)
                            .offset(y:25)
                        
                        
                        if correctPopUp {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .foregroundColor(.green)
                                .frame(width: 200, height: 200, alignment: .center)
                                .offset(y:15)
                                .animation(.easeIn, value: correctPopUp)
                            
                        }
                        if incorrectPopUp {
                            Image(systemName: "x.circle.fill")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 200, height: 200, alignment: .center)
                                .offset(y:15)
                                .animation(.easeIn, value: incorrectPopUp)
                            
                        }
                    }
                    
                    
                    
                    
                    Spacer()
                    Text("Moves Available")
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                        .padding()
                        .offset(y:-20)
                    
                    HStack (spacing: 10) {
                        ForEach(options, id: \.self) { option in
                            
                            Button (action: {
                                isCorrect = checkChoice(appChoice: appChoice, playerChoice: option , shouldWin: shouldWin)
                                withAnimation{
                                    if isCorrect {
                                        score += 1
                                        correctPopUp = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            self.correctPopUp = false
                                        }
                                    }else{
                                        if score > 0{
                                            score -= 1
                                        }
                                        incorrectPopUp = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            self.incorrectPopUp = false
                                        }
                                    }
                                }
                                
                                
                                if questionCount == 10 {
                                    showScore = true
                                }
                                
                                askQuestion()
                                
                            }) {
                            
                                Image(option)
                                    .resizable()
                                    .renderingMode(.original)
                                    .frame(width: 100, height: 100)
                            }
                        }
                        .padding(.top)
                        .offset(y:-45)
                    } // END: Hstack player choice buttons
                } //End: VStack spacing 25
                
                Spacer()
                Spacer()
                } // End: Vstack with score
                .padding()
        } // End: Zstack
        .alert(score > 7 ? "Great Game!" : "Nice try", isPresented: $showScore) {
            Button("Play Again", action: resetGame)
        } message: {
            Text("Your score was \(score)")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
