//
//  EyeView.swift
//  zavrsni-v2
//
//  Created by Luka Vujnovac on 26.02.2022..
//

import SwiftUI
import ARKit
import Vision

struct EyeView: Shape {
    @State var blinkFlag = false
    
    func path(in rect: CGRect) -> Path {
        Path { path in 
            let eyeOffset: CGFloat = rect.width / 3
            
            let p1 = CGPoint(x: rect.minX, y: rect.midY)
            let p2 = CGPoint(x: rect.maxX - (2 * eyeOffset), y: rect.maxY)
            let p3 = CGPoint(x: rect.maxX - eyeOffset, y: rect.maxY)
            let p4 = CGPoint(x: rect.maxX, y: rect.midY)
            let p5 = CGPoint(x: rect.maxX - eyeOffset, y: rect.minY)
            let p6 = CGPoint(x: rect.maxX - (2 * eyeOffset), y: rect.minY)
            
            path.move(to: p1)
            path.addLine(to: p2)
            path.addLine(to: p3)
            path.addLine(to: p4)
            path.addLine(to: p5)
            path.addLine(to: p6)
            path.addLine(to: p1)
        }
    }
    
    func blink(p1: Double, p2: Double, p3: Double, p4: Double, p5: Double, p6: Double) -> Bool {
        let ear = ((p2 - p6) + (p3 - p5)) / 2 * (p1 - p4) // eye aspect ratio
        if ear < 0.2 {
            self.blinkFlag = true
        }else {
            self.blinkFlag = false
        }
        return blinkFlag
    }
}
struct EyeView_Previews: PreviewProvider {
    static var previews: some View {
        EyeView()
            .frame(height: 100)
    }
}
