//
//  HomeViewModel.swift
//  zavrsni-v2
//
//  Created by Luka Vujnovac on 17.01.2022..
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var gears: [String] = ["N", "1", "2", "3", "4", "5", "6", "7", "8"]
    @Published var selection: Int = 0    
}
