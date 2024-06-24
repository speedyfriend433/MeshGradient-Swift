//
// ImageRenderer.swift
//
// Created by Speedyfriend67 on 24.06.24
//
 
import SwiftUI

struct ImageRenderer<Content: View> {
    let content: Content

    var uiImage: UIImage? {
        let controller = UIHostingController(rootView: content)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}