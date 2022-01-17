//
//  HomeView.swift
//  zavrsni-v2
//
//  Created by Luka Vujnovac on 17.01.2022..
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = HomeViewModel()
    @State private var selection: Int = 0
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
            VStack{
                
                
                HStack(spacing: 50) {
                    minusButton
                    
                    Text(vm.gears[vm.selection])
                        .font(.system(size: 50, weight: .semibold, design: .monospaced))
                        .foregroundColor(.white)
                    
                    plusButton
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    private var minusButton: some View {
        Button { 
            vm.selection -= 1
            
            if vm.selection < 0 {
                vm.selection = 0
            }
        } label: { 
            Text("-")
                .font(.system(size: 50, weight: .semibold, design: .monospaced))
            .foregroundColor(.white)
        }
    }
    
    private var plusButton: some View {
        Button { 
            vm.selection += 1
            if vm.selection > 8 {
                vm.selection = 8
            }
        } label: { 
            Text("+")
                .font(.system(size: 50, weight: .semibold, design: .monospaced))
            .foregroundColor(.white)
        }
    }
}
