//
//  TabBarItem.swift
//  zavrsni-v2
//
//  Created by Luka Vujnovac on 16.01.2022..
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case home, settings, style
    
    var iconName: String  {
        switch self {
            case .home: return "house"
            case .settings: return "gear"
            case .style: return "pencil"
        }
    }
    
    var title: String  {
        switch self {
            case .home: return "home"
            case .settings: return "settings"
            case .style: return "style"
        }
    }
    
    var color: Color  {
        switch self {
            case .home: return Color("darkBlue")
            case .settings: return .blue
            case .style: return .green
        }
    }
}
