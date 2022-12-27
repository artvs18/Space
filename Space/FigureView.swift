//
//  FigureView.swift
//  Space
//
//  Created by Artemy Volkov on 27.12.2022.
//

import SwiftUI

struct FigureView: View {
    let start: Bool
    
    var body: some View {
        ZStack {
            ForEach(0..<10) { i in
                Path { path in
                    path.addArc(
                        center: CGPoint(x: 50 + 10 * i, y: 50 + 10 * i),
                        radius: 50,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360),
                        clockwise: true
                    )
                    
                    path.addArc(
                        center: CGPoint(x: 50 + 10 * i, y: 50),
                        radius: 50,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360),
                        clockwise: true
                    )
                    
                    path.addArc(
                        center: CGPoint(x: 50, y: 50 + 10 * i),
                        radius: 50,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360),
                        clockwise: true
                    )
                    
                    path.addArc(
                        center: CGPoint(x: 50, y: 50 - 10 * i),
                        radius: 50,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360),
                        clockwise: true
                    )
                    
                    path.addArc(
                        center: CGPoint(x: 50 - 10 * i, y: 50),
                        radius: 50,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360),
                        clockwise: true
                    )
                    
                    path.addArc(
                        center: CGPoint(x: 50 - 10 * i, y: 50 - 10 * i),
                        radius: 50,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360),
                        clockwise: true
                    )
                    
                    path.addArc(
                        center: CGPoint(x: 50 - 10 * i, y: 50 + 10 * i),
                        radius: 50,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360),
                        clockwise: true
                    )
                    
                    path.addArc(
                        center: CGPoint(x: 50 + 10 * i, y: 50 - 10 * i),
                        radius: 50,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360),
                        clockwise: true
                    )
                }
                .stroke(
                    start ? Color.white : Color.yellow,
                    lineWidth: start ? 0.1 : 10
                )
                .animation(
                    .easeInOut(duration: 10).repeatForever(autoreverses: true),
                    value: start
                )
            }
        }
    }
}

struct FigureView_Previews: PreviewProvider {
    static var previews: some View {
        FigureView(start: true)
    }
}
