//
// GradientPoint.swift
//
// Created by Speedyfriend67 on 24.06.24
//
 
//
// GradientPoint.swift
//
// Created by Speedyfriend67 on 24.06.24
//
 
import SwiftUI

class GradientPoint: Identifiable, ObservableObject, Equatable {
    let id = UUID()
    @Published var position: CGPoint
    @Published var color: Color {
        didSet {
            if colorHistory.last != color {
                colorHistory.append(color)
            }
        }
    }
    private var colorHistory: [Color] = []

    init(position: CGPoint, color: Color) {
        self.position = position
        self.color = color
        self.colorHistory = [color]
    }

    func undoColorChange() {
        if colorHistory.count > 1 {
            colorHistory.removeLast()
            color = colorHistory.last!
        }
    }

    static func == (lhs: GradientPoint, rhs: GradientPoint) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Color {
    static var random: Color {
        Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}
