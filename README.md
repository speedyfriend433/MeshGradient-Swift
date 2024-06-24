# MeshGradientTest

MeshGradientTest is an iOS application that allows users to create and edit mesh gradients. The application supports various gradient styles and enables users to save the created gradients as PNG images.

## Key Features

- Create and edit mesh gradients
- Add, move, and delete points
- Change point colors and revert to previous colors
- Support for multiple gradient styles (linear, radial)
- Save gradients as PNG images
- Grid background for easier point alignment
- Adjustable point size
- Undo last action
- Save and load gradient data

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/MeshGradientTest.git
    ```
2. Open the project in Xcode:
    ```bash
    cd MeshGradientTest
    open MeshGradientTest.xcodeproj
    ```
3. Build and run the project on your iOS device or simulator.

## Usage

1. Tap on the screen to add a new point.
2. Drag points to move them around.
3. Use the context menu on each point to change its color, undo the last color change, or remove the point.
4. Adjust the point size using the slider in the navigation bar.
5. Select the gradient style using the segmented control at the bottom.
6. Save the current gradient as a PNG image by tapping the "Save" button in the navigation bar.
7. Undo the last action by tapping the "Undo" button in the navigation bar.
8. Save and load gradient data using the buttons below the gradient editor.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any bug fixes or new features.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [SwiftUI](https://developer.apple.com/xcode/swiftui/) - for the user interface
- [CoreGraphics](https://developer.apple.com/documentation/coregraphics) - for gradient rendering
