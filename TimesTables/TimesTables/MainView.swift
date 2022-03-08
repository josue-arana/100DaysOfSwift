//
//  MainView.swift
//  TimesTables
//
//  Created by Josue Arana on 3/4/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            SettingsView()
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                    }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
