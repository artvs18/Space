//
//  ContentView.swift
//  Space
//
//  Created by Artemy Volkov on 26.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var start = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            let frame = geometry.frame(in: CoordinateSpace.local)
            
            ZStack {
                Color.black
                
                ForEach(0..<1000) { _ in
                    let width = Double.random(in: 1...3)
                    let x = Double.random(in: -frame.maxX...frame.maxX)
                    let y = Double.random(in: -frame.maxY...frame.maxY)
                    let opacity = Double.random(in: 0.1...1)
                    
                    Circle()
                        .fill(start ? .white : .black)
                        .frame(width: width)
                        .offset(x: x, y: y)
                        .opacity(start ? 1 : opacity)
                        .shadow(color: .white, radius: start ? 10 : 1)
                        .animation(
                            .easeInOut(duration: 10)
                            .repeatForever(autoreverses: true),
                            value: start
                        )
                    
                }
                .rotationEffect(.degrees(start ? 360 : 0))
                .animation(.linear(duration: 600), value: start)
                
                FigureView(start: start)
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(start ? -360 : 0))
                    .clipShape(Circle())
                    .scaleEffect(start ? 3.5 : 0.5)
                    .shadow(
                        color: start ? .white : .yellow,
                        radius: start ? 10 : 20
                    )
                    .animation(
                        .easeInOut(duration: 10)
                        .repeatForever(autoreverses: true),
                        value: start
                    )
                
                
                Button(action: { start.toggle() }) {
                    Text("Start Animation")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                }
                .offset(y: start ? 400 : 200)
                .shadow(color: .white, radius: 10)
                .scaleEffect(start ? 0 : 1)
                .animation(.easeInOut(duration: 1), value: start)
            }
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
