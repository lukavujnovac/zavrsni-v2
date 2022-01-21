//
//  ContentView.swift
//  zavrsni-v2
//
//  Created by Luka Vujnovac on 16.01.2022..
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) { 
            HomeView()
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            Color.blue
                .tabBarItem(tab: .style, selection: $tabSelection)
            
            Color.red
                .tabBarItem(tab: .settings, selection: $tabSelection)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
