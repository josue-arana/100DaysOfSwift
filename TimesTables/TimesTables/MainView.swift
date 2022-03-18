//
//  MainView.swift
//  TimesTables
//
//  Created by Josue Arana on 3/4/22.
//

import SwiftUI

struct WelcomeView: View {
    
//    @State var isShowing : Bool
    
    var body: some View {
        ZStack{
//            if isShowing {

//                LinearGradient(colors: [.green, .indigo ], startPoint: .topLeading, endPoint: .bottomTrailing)
//                    .opacity(0.5)
//                    .ignoresSafeArea()
                
                Color.black
                    .opacity(0.9)
                    .ignoresSafeArea()
                
                Image("logoSmall")
                    .resizable()
                    .frame(maxWidth: 325, maxHeight: 325, alignment: .center)
                    .transition(.slide)
//            }
        }
        
    }
}


struct MainView: View {
    
    init() {
//            UITabBar.appearance().backgroundColor = UIColor.systemIndigo
            UITabBar.appearance().unselectedItemTintColor = UIColor.white
        }
    
    var settings: Settings = Settings()
    @State private var tabSelection = 1
    @State private var isShowingWelcome = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timeRemaining = 2
    
    var body: some View {
        
        ZStack{
            if isShowingWelcome {
                Color.black
                    .ignoresSafeArea()
                Image("logoSmall")
                    .resizable()
                    .frame(maxWidth: 325, maxHeight: 325, alignment: .center)
                    .transition(.asymmetric(insertion: .slide, removal: .scale))
            }
            else if !isShowingWelcome {
                
                TabView(selection:$tabSelection) {
                    ContentView(settings: settings)
                        .tabItem {
        //                    Label("", systemImage: "gamecontroller.fill")
                            Image(systemName: "gamecontroller.fill")
                                .renderingMode(.template)
                        }
                        .tag(1)
                    
                    SettingsView(settings: settings, tabSelection: $tabSelection)
                        .tabItem{
                            Image(systemName: "gearshape.fill")
                                .renderingMode(.template)
                        }
                        .tag(2)
                }
                .accentColor(.green)
            
            }
            
                
            
        }
        .onReceive(timer) { time in
            guard isShowingWelcome else { return }
            
//            if timeRemaining > 0 {
//                withAnimation {
//                    isShowingWelcome = true
//                }
//            } else {
//                withAnimation {
//                    isShowingWelcome = false
//                }
//            }
//            timeRemaining -= 1
            
            if timeRemaining > 0 {
                timeRemaining -= 1
            }else{
                withAnimation {
                    isShowingWelcome = false
                }
            }
            
        }
        
        
        
    }
     
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
//        WelcomeView()
        MainView()
    }
}
