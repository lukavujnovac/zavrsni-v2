//
//  TabBarItem.swift
//  zavrsni-v2
//
//  Created by Luka Vujnovac on 16.01.2022..
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case dashBoard, settings, garage
    
    var iconName: String  {
        switch self {
            case .dashBoard: return "dashBoard"
            case .settings: return "settings"
            case .garage: return "garage"
        }
    }
    
    var title: String  {
        switch self {
            case .dashBoard: return "dash board"
            case .settings: return "settings"
            case .garage: return "garage"
        }
    }
    
    var color: Color  {
        switch self {
            case .dashBoard: return .red
            case .settings: return .blue
            case .garage: return .green
        }
    }
}
