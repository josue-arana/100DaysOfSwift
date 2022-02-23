//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Josue Arana on 2/19/22.
//

import SwiftUI



struct InstructionsView: View {
    
    @Binding var isPresented: Bool
    
    
    var gameRules = """
    Rock/Paper/Scissors Shoot!
    
    This game is for you to think fast.
    
    As soon as you start the game, the first round will begin. The app will make a move (rock, paper or scissors) and you will have 3 seconds to choose one of the available moves. There are 10 rounds. The goal is to win as many rounds as you can.
    
    Coins:
    You get a coin for every round you win.
    
    Example:
    If the app chooses “Rock”, you need to choose “Paper”.
    """
    
    
    var body : some View {
        
        
        ZStack {
            LinearGradient(colors: [.black,.indigo], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                Text("RPS GAME")
                    .font(.largeTitle)
                    .foregroundColor(.white)
//                Text("(Rock Paper Scissors)")
//                    .font(.title2)
//                    .foregroundColor(.white)
//                    .frame(alignment: .center)
                Text("By Josue Arana")
                    .font(.title3)
                    .foregroundColor(.white)
                    .frame(alignment: .center)
                
                Text(gameRules)
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(30)
                HStack {
                    Button("Got it!"){
                        isPresented = false
                    }
                    .frame(width: 150, height: 50)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    
                    
                    
                }
                
            }// end vstack
        } //End zstack
    }
}



struct ContentView: View {
    
//    private var options = ["🤛", "🖐", "✌️"]
    private var options = ["rock", "paper", "scissors"]
    private var rock = "rock"
    @State private var appChoice: String = "rock"
    @State private var score: Int = 0
    @State private var isCorrect: Bool = false
    @State private var showScore = false
    private var darkBlue = Color(red: 34, green: 56, blue: 100)
    
    @State var showInstructions = true
    @State private var roundsCount = 1
    @State private var correctPopUp = false
    @State private var incorrectPopUp = false
    
    
    
    @State private var newRound = false
    
    @State private var timeRemaining = 3
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func endGame(){
        showScore = true
        isActive = false
    }
    
    func resetGame() {
        showScore = false
        appChoice = options[Int.random(in: 0..<options.count)]
        roundsCount = 1
        score = 0
        isActive = true
    }
    func askQuestion(){
        
        if roundsCount >= 10 {
            endGame()
        }
        
        appChoice = options[Int.random(in: 0..<options.count)]
        roundsCount += 1
        timeRemaining = 3
    }
    
    func checkChoice(appChoice:String, playerChoice: String) -> Bool {
        
        var answer: String
        
        if appChoice == "rock" {
            answer = "paper"
        } else if appChoice == "paper" {
            answer = "scissors"
        } else {
            answer = "rock"
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
                
                HStack { //Instructions, coins
                    
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
                        InstructionsView(isPresented: $showInstructions)
                    }
                    
                    
                    Spacer()
                    
                    ZStack{ //Coin score
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
                        
                        if correctPopUp {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .foregroundColor(.green)
                                .frame(width: 40, height: 40, alignment: .trailing)
                                .offset(x: -25)
                                .animation(.easeIn, value: correctPopUp)
                            
                        }
                        if incorrectPopUp {
                            Image(systemName: "x.circle.fill")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 40, height: 40, alignment: .trailing)
                                .offset(x: -25)
                                .animation(.easeIn, value: incorrectPopUp)
                            
                        }
                    }
                    .padding(.trailing)
                    
                }
                
                HStack{
                    
                    if isActive {
                        Button(action: {
                            isActive = false
                        })
                        {
                            Image(systemName: "pause.circle.fill" )
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30, alignment: .leading)
                                .offset(x:35, y:10)
                            Spacer()
                        }
                    }
                }
                
                if isActive {
                    Spacer()
                    VStack {
                        
                        Text("Round \(roundsCount)")
                            .font(.system(size: 25))
                            .foregroundStyle(.gray)
                        
                        
                        //3 Seccond Timer
                        Text("\(timeRemaining)")
                            .padding(.bottom)
                            .font(.system(size: 50))
                            .foregroundStyle(.white)
                        
                    }
                    .offset(y: isActive ? 32 : 70 )
                }
                
                Spacer()
                
                VStack (spacing: 0) {
                    Spacer()
                    
                    //Apps move
                    ZStack{
                        
                        if showScore {
                            
                            VStack(spacing:10) {
                                Text("YOUR SCORE")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                
                                Text("\(score)")
                                    .font(.system(size: 100))
                                    .foregroundStyle(.white)
                                
                                Button("Play Again", action: resetGame)
                                    .frame(width: 150, height: 50, alignment: .center)
                                    .background(.black.opacity(0.8))
                                    .foregroundColor(.white)
                                    .cornerRadius(30)
                                }
                        }
                        
                        else if isActive {
                            Image(appChoice)
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 200, height: 200)
                                .shadow(radius: 55)
                        }
                        else if !isActive {
                            Button (action: {
                                isActive = true
                            }){
                                Image(systemName: "play.circle.fill")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 200, height: 200)
                                    .shadow(radius: 55)
                            }
                        }
                        
//                        if correctPopUp {
//                            Image(systemName: "checkmark.circle.fill")
//                                .resizable()
//                                .foregroundColor(.green)
//                                .frame(width: 200, height: 200, alignment: .center)
////                                .offset(y:15)
//                                .animation(.easeIn, value: correctPopUp)
//
//                        }
//                        if incorrectPopUp {
//                            Image(systemName: "x.circle.fill")
//                                .resizable()
//                                .foregroundColor(.red)
//                                .frame(width: 200, height: 200, alignment: .center)
////                                .offset(y:15)
//                                .animation(.easeIn, value: incorrectPopUp)
//
//                        }
                    }
                    
                    Spacer()
                    
                    if isActive {
                    
                        Text("Moves Available")
                            .font(.system(size: 20))
                            .foregroundStyle(.white)
                            .padding()
                            .offset(y:-20)
                        
                        HStack (spacing: 10) {
                            ForEach(options, id: \.self) { option in
                                
                                Button (action: {
                                    isCorrect = checkChoice(appChoice: appChoice, playerChoice: option)
                                    withAnimation{
                                        if isCorrect {
                                            score += 1
                                            correctPopUp = true
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                self.correctPopUp = false
                                            }
                                        }else{
    //                                        if score > 0{
    //                                            score -= 1
    //                                        }
                                            incorrectPopUp = true
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                self.incorrectPopUp = false
                                            }
                                        }
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
                    }
                } //End: VStack spacing 25
                
                Spacer()
                Spacer()
                } // End: Vstack with score
                .padding()
        } // End: Zstack
//        .alert(score > 7 ? "Great Game!!" : "Keep it up!", isPresented: $showScore) {
//            Button("Play Again", action: resetGame)
//        } message: {
//            Text("Your score was \(score)")
//        }
        .onReceive(timer) { time in
            guard isActive else { return }
            
            if timeRemaining > 0 {
                timeRemaining -= 1
            }else{
                askQuestion()
            }
        }
//        .onChange(of: scenePhase) { newPhase in
//            if newPhase == .active {
//                isActive = true
//            } else {
//                isActive = false
//            }
//        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
