//
// GradientEditorView.swift
//
// Created by Speedyfriend67 on 24.06.24
//
 
import SwiftUI

struct GradientEditorView: View {
    @State private var points: [GradientPoint] = []
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var selectedPointSize: CGFloat = 30
    @State private var selectedGradientStyle: GradientStyle = .linear
    @State private var gradientData: [GradientPoint] = []

    var body: some View {
        VStack {
            ZStack {
                GridBackground()
                    .edgesIgnoringSafeArea(.all)
                
                GeometryReader { geometry in
                    GradientMesh(points: points, gradientStyle: selectedGradientStyle)
                        .edgesIgnoringSafeArea(.all)
                        .gesture(DragGesture(minimumDistance: 0).onEnded { value in
                            let tapLocation = value.location
                            let newPoint = CGPoint(x: tapLocation.x, y: tapLocation.y)
                            points.append(GradientPoint(position: newPoint, color: .random))
                        })
                }
                ForEach($points) { $point in
                    Circle()
                        .fill(point.color)
                        .frame(width: selectedPointSize, height: selectedPointSize)
                        .position(point.position)
                        .gesture(DragGesture().onChanged { value in
                            point.position = value.location
                        })
                        .contextMenu {
                            ColorPicker("Pick Color", selection: $point.color)
                            Button("Undo Color Change") {
                                point.undoColorChange()
                            }
                            Button("Remove") {
                                points.removeAll { $0.id == point.id }
                            }
                        }
                }
            }
            .navigationBarItems(trailing: HStack {
                Button(action: saveGradient) {
                    Text("Save")
                }
                Button(action: undoLastAction) {
                    Text("Undo")
                }
                Slider(value: $selectedPointSize, in: 10...50, label: {
                    Text("Point Size")
                })
            })
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Export Status"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            
            HStack {
                Button(action: saveGradientData) {
                    Text("Save Gradient")
                }
                Button(action: loadGradientData) {
                    Text("Load Gradient")
                }
            }
            Picker("Gradient Style", selection: $selectedGradientStyle) {
                ForEach(GradientStyle.allCases, id: \.self) { style in
                    Text(style.rawValue).tag(style)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }

    private func saveGradient() {
        let renderer = ImageRenderer(content: GradientMesh(points: points, gradientStyle: selectedGradientStyle))
        if let image = renderer.uiImage {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            alertMessage = "Image saved to Photos"
        } else {
            alertMessage = "Failed to save image"
        }
        showAlert = true
    }
    
    private func undoLastAction() {
        if !points.isEmpty {
            points.removeLast()
        }
    }
    
    private func saveGradientData() {
        gradientData = points
        alertMessage = "Gradient data saved"
        showAlert = true
    }
    
    private func loadGradientData() {
        if !gradientData.isEmpty {
            points = gradientData
            alertMessage = "Gradient data loaded"
        } else {
            alertMessage = "No gradient data to load"
        }
        showAlert = true
    }
}