//
//  CustomTabBarContainerView.swift
//  zavrsni-v2
//
//  Created by Luka Vujnovac on 16.01.2022..
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    public init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }

    
    var body: some View {
        ZStack(alignment: .bottom){
            content
                .ignoresSafeArea()
            
            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
        }
        .onPreferenceChange(TabBarItemPreferenceKeys.self) { value in
            self.tabs = value
        }
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [.dashBoard, .settings, .garage]
    
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(tabs.first!)) { 
            Color.red
        }
    }
}
