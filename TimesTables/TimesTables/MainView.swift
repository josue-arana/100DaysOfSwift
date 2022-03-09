//
//  MainView.swift
//  TimesTables
//
//  Created by Josue Arana on 3/4/22.
//

import SwiftUI

struct MainView: View {
    
    var settings: Settings = Settings()
    @State private var tabSelection = 2

    
    
    var body: some View {
        TabView(selection:$tabSelection) {
            ContentView(settings: settings)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
                .tag(1)
            SettingsView(settings: settings, tabSelection: $tabSelection)
                .tabItem{
                    Image(systemName: "gearshape.fill")
                }
                .tag(2)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
