import Foundation

struct Rectangle {
    var width: Double
    var height: Double
    
    var area: Double {
        get {
            return width * height
        }
        set(newArea) {
            let aspectRatio = width / height
            height = sqrt(newArea / aspectRatio)
            width = newArea / height
        }
    }
}

var rect = Rectangle(width: 10, height: 5)
print("Initial area: \(rect.area)")

rect.area = 99
print("New width: \(rect.width), New height: \(rect.height)")
