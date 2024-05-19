// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SwiftCommandLineApp",
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.0")
    ],
    targets: [
        .target(
            name: "SwiftCommandLineApp",
            dependencies: ["SwiftCommandLineAppCore"]),
        .target(
            name: "SwiftCommandLineAppCore",
            dependencies: ["Alamofire"]),
        .testTarget(
            name: "SwiftCommandLineAppTests",
            dependencies: ["SwiftCommandLineAppCore"]),
    ]
)
