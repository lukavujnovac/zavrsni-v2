//
//  ContentView.swift
//  zavrsni-v2
//
//  Created by Luka Vujnovac on 16.01.2022..
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: String = "dashBoard"
        @State private var tabSelection: TabBarItem = .garage
    
    var body: some View {
            CustomTabBarContainerView(selection: $tabSelection) { 
                Color.red
                    .tabBarItem(tab: .dashBoard, selection: $tabSelection)
                
                Color.blue
                    .tabBarItem(tab: .garage, selection: $tabSelection)
                
                Color.green
                    .tabBarItem(tab: .settings, selection: $tabSelection)
                
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
