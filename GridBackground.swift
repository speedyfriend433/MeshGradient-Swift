//
// GridBackground.swift
//
// Created by Speedyfriend67 on 24.06.24
//
 
import SwiftUI

struct GridBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let spacing: CGFloat = 20
                let columns = Int(geometry.size.width / spacing)
                let rows = Int(geometry.size.height / spacing)
                
                for i in 0...columns {
                    let x = CGFloat(i) * spacing
                    path.move(to: CGPoint(x: x, y: 0))
                    path.addLine(to: CGPoint(x: x, y: geometry.size.height))
                }
                
                for j in 0...rows {
                    let y = CGFloat(j) * spacing
                    path.move(to: CGPoint(x: 0, y: y))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: y))
                }
            }
            .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
        }
    }
}