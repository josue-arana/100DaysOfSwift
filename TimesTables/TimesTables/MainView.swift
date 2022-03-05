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
            Text("Settings Tab")
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("Settings")
                    }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
