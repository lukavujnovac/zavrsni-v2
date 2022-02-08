//
//  EyeBlinkView.swift
//  zavrsni-v2
//
//  Created by Luka Vujnovac on 08.02.2022..
//

import SwiftUI

struct Eye: Shape {
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
    
    func blink(p1: CGRect, p2: CGRect, p3: CGRect, p4: CGRect, p5: CGRect, p6: CGRect)  {
//        let eap = ((p2 - p6) + (p3 - p5)) / 2 * (p1 - p4) // eye aspect ratio
        
//        if eap < 0.2 {
//            return "blink"
//        }else {
//            return "no blink"
//        }
    }
}

struct EyeBlinkView: View {
    var body: some View {
        Eye()
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .padding()
    }
}

struct EyeBlinkView_Previews: PreviewProvider {
    static var previews: some View {
        EyeBlinkView()
    }
}
