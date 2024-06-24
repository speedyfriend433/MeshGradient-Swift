//
// GradientPoint.swift
//
// Created by Speedyfriend67 on 24.06.24
//
 
import SwiftUI

struct GradientPoint: Identifiable, Equatable {
    let id = UUID()
    var position: CGPoint
    var color: Color
}

extension Color {
    static var random: Color {
        Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}