//
//  HomeView.swift
//  zavrsni-v2
//
//  Created by Luka Vujnovac on 17.01.2022..
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm1 = HomeViewModel()
    @State private var selection: Int = 0
    @State private var animate: Bool = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color("darkBlue"))
            VStack(spacing: 100){
                logoView
                
                HStack(spacing: 10) {
                    minusButton
                    
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 250, height: 150)
                        .foregroundColor(.indigo)
                        .overlay(
                            VStack(spacing: 40) {
                                HStack {
                                    Text("Gear:")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .bold, design: .rounded))
                                    Spacer()
                                }
                                
                                Text(vm1.gears[vm1.selection])
                                    .font(.system(size: 50, weight: .semibold, design: .monospaced))
                                    .foregroundColor(.white)
                            }
                                .padding()
                        )
                    
                    plusButton
                }
                
                HStack {
                    Image("formula2")
                        .resizable()
                        .scaledToFit()
                        .offset(x: animate ? UIScreen.main.bounds.width - 180 : 0)
                    
                    Spacer()
                }
                .padding()
                
                Spacer()
            }
        }
        .onAppear { 
            withAnimation(Animation.easeInOut.repeatForever()) {
                animate.toggle()
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
            vm1.selection -= 1
            
            if vm1.selection < 0 {
                vm1.selection = 0
            }
        } label: { 
            Text("-")
                .font(.system(size: 50, weight: .semibold, design: .monospaced))
                .foregroundColor(Color("darkBlue"))
        }
    }
    
    private var plusButton: some View {
        Button { 
            vm1.selection += 1
            if vm1.selection > 8 {
                vm1.selection = 8
            }
        } label: { 
            Text("+")
                .font(.system(size: 50, weight: .semibold, design: .monospaced))
                .foregroundColor(Color("darkBlue"))
        }
    }
    
    private var logoView: some View {
        Image("redbull")
            .resizable()
            .scaledToFit()
            .scaleEffect(0.6)
    }
}
