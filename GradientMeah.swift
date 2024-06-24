//
// GradientMeah.swift
//
// Created by Speedyfriend67 on 24.06.24
//
 
import SwiftUI

enum GradientStyle: String, CaseIterable {
    case linear = "Linear"
    case radial = "Radial"
}

struct GradientMesh: View {
    var points: [GradientPoint]
    var gradientStyle: GradientStyle

    var body: some View {
        Canvas { context, size in
            guard points.count > 1 else { return }
            
            let stops = points.map { Gradient.Stop(color: $0.color, location: $0.position.x / size.width) }
            let gradient = Gradient(stops: stops)

            let path = Path { path in
                path.addRect(CGRect(origin: .zero, size: size))
            }

            switch gradientStyle {
            case .linear:
                context.fill(path, with: .linearGradient(gradient, startPoint: .zero, endPoint: CGPoint(x: size.width, y: size.height)))
            case .radial:
                context.fill(path, with: .radialGradient(gradient, center: CGPoint(x: size.width / 2, y: size.height / 2), startRadius: 0, endRadius: min(size.width, size.height) / 2))
            }
        }
    }
}